class InformativoObrasController < ApplicationController
  before_action :set_informativo_obra, only: [:show, :edit, :update, :destroy]

  # GET /informativo_obras
  # GET /informativo_obras.json
  def index

    if session[:perfil] == "Comum" or session[:perfil] == "Técnico" or session[:perfil] == "Zelador"

      @informativo_obras = InformativoObra.where(:usuario_id => current_user).order("id desc")

    elsif session[:perfil] == "Administrador"

      @informativo_obras = InformativoObra.all

    end


  end

  # GET /informativo_obras/1
  # GET /informativo_obras/1.json
  def show
  end

  # GET /informativo_obras/new
  def new
    @informativo_obra = InformativoObra.new
  end

  # GET /informativo_obras/1/edit
  def edit
  end


  def enviaranalise

    set_informativo_obra

    @status = Statusobra.find_by_statusobra_type("Enviado para análise")
    @informativo_obra.statusobra_id = @status.id

    @informativo_obra.save

    @admin = Usuario.joins(:permitidos).where(" permitidos.perfil_id = 1 ")

    @admin.each do |adm|
      Notifier.informobraanalise(@informativo_obra, adm.emailPrincipalUsuario).deliver_now
    end

    addlog("Registrou: Enviou para análise o pedido")

    respond_to do |format|
      format.html { redirect_to informativo_obras_url, notice: 'Informativo de obra enviado para análise com sucesso.'}
    end

  end

  def concluida

    set_informativo_obra

    @status = Statusobra.find_by_statusobra_type("Obra concluída")
    @informativo_obra.statusobra_id = @status.id
    @informativo_obra.dataconclusao = DateTime.now

    @informativo_obra.save

    addlog("Registrou: Data concluída em projeto")

    respond_to do |format|
      format.html { redirect_to informativo_obras_url, notice: 'Informativo de obra concluído com sucesso.'}
    end

  end

  # POST /informativo_obras
  # POST /informativo_obras.json
  def create
    @informativo_obra = InformativoObra.new(informativo_obra_params)

    @status = Statusobra.find_by_statusobra_type("Salvo")
    @informativo_obra.statusobra_id = @status.id

    respond_to do |format|
      if @informativo_obra.save
        format.html { redirect_to @informativo_obra, notice: 'Informativo de obra foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @informativo_obra }
      else
        format.html { render :new }
        format.json { render json: @informativo_obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informativo_obras/1
  # PATCH/PUT /informativo_obras/1.json
  def update
    respond_to do |format|
      if @informativo_obra.update(informativo_obra_params)
        format.html { redirect_to @informativo_obra, notice: 'Informativo de obra foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @informativo_obra }
      else
        format.html { render :edit }
        format.json { render json: @informativo_obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informativo_obras/1
  # DELETE /informativo_obras/1.json
  def destroy
    @informativo_obra.destroy
    respond_to do |format|
      format.html { redirect_to informativo_obras_url, notice: 'Informativo obra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informativo_obra
      @informativo_obra = InformativoObra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def informativo_obra_params
      params.require(:informativo_obra).permit(:local, :building_id, :department_id, :andar, :laboratorio, :contratante, :ramal, :email, :descricao, :intervencaologica, :intervencaotelefonia, :nomeemp, :cnpjemp, :foneemp, :responsavelemp, :rgemp, :nomeemergencia, :foneemergencia, :previnicio, :prevtermino, :origemrecurso, :usuario_id, :fotoobra1, :fotoobra2, :fotoobra3, :fotoobra4, :fotoobra5, :oficio1, :oficio2, :oficio3, :oficio4, :oficio5, :oficio6, :oficio7, :oficio8, :oficio9, :oficio10, :planta1, :planta2, :planta3, :planta4, :planta5, :planta6, :planta7, :planta8, :planta9, :planta10, :statusobra_id, :justificativa, :dataconclusao)

    end
end
