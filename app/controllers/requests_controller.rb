# frozen_string_literal: true
class RequestsController < ApplicationController
  before_filter 'autenticado?'
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_tecnicos, only: [:new, :create, :edit] #carregar os possíveis técnicos disponíveis

  # GET /requests
  def index

    if session[:perfil] == "Comum"

      @requests = Request.where(:usuario_id => current_user).order("id desc")

    elsif session[:perfil] == "Técnico"

      predios_tecnicos =  Building.joins(:atendimentos).select("building_id").where(:desativado => false).where("atendimentos.usuario_id = #{current_user.id}")
      @requests = Request.joins(:category).joins(:status).where(" statuses.desativado = false and categories.desativado = false and building_id in (?) ", predios_tecnicos)

    elsif session[:perfil] == "Administrador" or session[:perfil] == "Zelador"
      @requests = Request.all.order("id desc")

    end

    end

  def resultindex

    sbusca = ""

    if session[:perfil] == "Técnico"
      @building = Building.joins(:atendimentos).where(:desativado => false).where("atendimentos.usuario_id = #{current_user.id}")
      @predios_tecnicos =  Building.joins(:atendimentos).select("building_id").where(:desativado => false).where("atendimentos.usuario_id = #{current_user.id}")

      @predios_tecnicos.each do |pt|

        if sbusca == ""
          sbusca = "building_id in (" + pt.building_id.to_s
        else
          sbusca = sbusca + ",#{pt.building_id.to_s}"
        end
      end

      sbusca = sbusca = sbusca + ")"

    else
      @building = Building.where(:desativado => false)
    end

    if params[:building] == nil

    elsif params[:building] != ""
      sbusca = " building_id = " + params[:building]
    end

    if params[:category] == nil

    elsif params[:category] != ""

      if sbusca != ""
        sbusca = sbusca + " and "
      end
      sbusca = sbusca + " category_id = " + params[:category]
    end

    if params[:status] == nil

    elsif params[:status] != ""
      if sbusca != ""
        sbusca = sbusca + " and "
      end
      sbusca = sbusca + " status_id = " + params[:status]
    end

    @requests = Request.where(sbusca).order("id desc")

  end

  def relstatus

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])
    @reqstatus = Request.joins(:status).select("count(requests.id) as total, statuses.status_type").
                group("statuses.status_type").
                where("year(requests.created_at) = ? ", @ano)
  end

  def relstatuspredio

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])
    @reqstatus = Request.joins(:status).joins(:building).select("count(requests.id) as total, statuses.status_type, buildings.building_type").
                group("statuses.status_type, buildings.building_type").
                where("year(requests.created_at) = ? ", @ano).order("buildings.building_type")
  end

  def relpredio

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])
    @reqstatus = Request.joins(:building).select("count(requests.id) as total, buildings.building_type ").
                group(" buildings.building_type").
                where("year(requests.created_at) = ? ", @ano).order("buildings.building_type")
  end

  def reldepto

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])
    @reqstatus = Request.joins(:department).select("count(requests.id) as total, departments.department_type").
                group(" departments.department_type").
                where("year(requests.created_at) = ? ", @ano ).order("departments.department_type")
  end

  def relstatusdepto

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])
    @reqstatus = Request.joins(:department).joins(:status).select("count(requests.id) as total, departments.department_type, statuses.status_type").
                group(" departments.department_type, statuses.status_type").
                where("year(requests.created_at) = ? " , @ano).order("departments.department_type, statuses.id")
  end

  def relfin

    @ano = (params[:date] == nil ? Time.now.year : params[:date][:year])

    @relfin = Request.joins(:department).select("departments.department_type, requests.subject, requests.request_local, requests.statusfin, requests.material, requests.verbamaterial, requests.created_at").
        where(" requests.statusfin in ('Aguardando compra', 'Pedido comprado', 'Material disponível') and year(requests.created_at) = ? ", @ano)


   # SELECT d.department_type, r.subject, r.request_local, r.statusfin, r.material, r.verbamaterial FROM requests r inner join departments d ON d.id = r.department_id
   # WHERE r.statusfin in ('Aguardando compra', 'Pedido comprado', 'Material disponível')


  end

  def enviarfin

    set_request

    if @request.tecnico_id.nil?
      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Esse pedido precisa ser atendido por um técnico para depois ser enviado ao financeiro.'}
      end
    elsif @request.verbamaterial.nil?
      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Esse pedido precisa ter a verba definida para ser enviado ao financeiro.'}
      end
    elsif @request.material.nil?
      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Esse pedido precisa ter a lista de material cadastrada para o financeiro realizar a compra.'}
      end
    else
      @request.statusfin = "Aguardando compra"
      @request.save

      addlog("Enviou para o finaceiro o pedido")

      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Enviado para o financeiro para fazer a compra do material'}
      end
    end

  end

  def pedidocomprado

    set_request

    @request.statusfin = "Pedido comprado"
    @request.save

    addlog("Registrou: Pedido com material comprado ")

    respond_to do |format|
      format.html { redirect_to requests_url}
    end

  end

  def reqfinalizar

    set_request

    @_status = Status.find_by_status_type("Finalizado")
    @request.status_id = @_status.id

    @request.save

    Notifier.pedidoFinalizado(@request).deliver_now if @request.status.status_type == "Finalizado"

    addlog("Registrou: Pedido finalizado ")

    respond_to do |format|
      format.html { redirect_to requests_url}
    end

  end


  def materialdisp

    set_request

    @request.statusfin = "Material disponível"
    @request.save

    emaildotecnico = emailtecdesignado(@request.tecnico_id)
    Notifier.avisomatdisp(@request, emaildotecnico).deliver_now

    addlog("Registrou: Pedido com material disponível ")

    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Material disponível para uso da manutenção'}
    end
  end


  def emailtecdesignado(tecnico)

    @tecnico = Usuario.where(:id => tecnico)

    @tecnico.each do |tec|
      @tecnicodesignado = tec.emailPrincipalUsuario
    end

    if @tecnicodesignado.nil?
      @tecnicodesignado = " "
    end

    return @tecnicodesignado

  end

  def buscafin
    @requests = Request.where(" statusfin in ('Aguardando compra', 'Pedido comprado', 'Material disponível') ").order("id desc")
  end

  # GET /requests/1
  def show
  end

  # GET /requests/new
  def new

    @request = Request.new
    @request.comentarios.build if @request.comentarios.empty?

  end

  def set_tecnicos
    @tecnicos =  Usuario.joins(:permitidos).where(" permitidos.perfil_id = 2")
  end

  # GET /requests/1/edit
  def edit
    @request.comentarios.build if @request.comentarios.empty?

  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    @request.usuario_id = current_user.id
    @request.status = Status.find_by(:status_type => "Novo")


    if @request.save
      addlog("Fez um novo pedido")

      Notifier.pedidoCriado(@request).deliver_now
      redirect_to @request, notice: "Requisição foi criada com sucesso."

    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      addlog("Atualizou o pedido")

      Notifier.pedidoAtualizado(@request).deliver_now if @request.status.status_type == "Andamento"

      Notifier.pedidoFinalizado(@request).deliver_now if @request.status.status_type == "Finalizado"

      redirect_to @request, notice: "Requisição foi atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    addlog("Apagou o pedido")
    redirect_to requests_url, notice: "Requisição foi apagada com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:subject, :request_local, :problem_description, :status_id, :category_id, :building_id, :usuario_id, :foto1, :foto2, :foto3, :tecnico_id, :department_id, :material, :verbamaterial, comentarios_attributes:[:id, :parecer, :request_id, :usuario_id, :_destroy])
    end
end
