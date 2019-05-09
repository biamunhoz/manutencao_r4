class StatusobrasController < ApplicationController
  before_filter 'autenticado?', 'tempermissao?'
  before_action :set_statusobra, only: [:show, :edit, :update, :destroy]

  # GET /statusobras
  # GET /statusobras.json
  def index
    @statusobras = Statusobra.all
  end

  # GET /statusobras/1
  # GET /statusobras/1.json
  def show
  end

  # GET /statusobras/new
  def new
    @statusobra = Statusobra.new
  end

  # GET /statusobras/1/edit
  def edit
  end

  # POST /statusobras
  # POST /statusobras.json
  def create
    @statusobra = Statusobra.new(statusobra_params)

    respond_to do |format|
      if @statusobra.save
        addlog("Cadastrou novo status de obra")
        format.html { redirect_to @statusobra, notice: "Status de obra foi criado com sucesso." }
        format.json { render :show, status: :created, location: @statusobra }
      else
        format.html { render :new }
        format.json { render json: @statusobra.errors, status: :unprocessable_entity }
      end
    end
  end

  def desativastaobra

    set_status

    @statusobra.desativado = true
    @statusobra.save

    addlog("Desativou um status")

    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status desativado com sucesso.'}
    end

  end

  # PATCH/PUT /statusobras/1
  # PATCH/PUT /statusobras/1.json
  def update
    respond_to do |format|
      if @statusobra.update(statusobra_params)
        addlog("Atualizou um status de obra")
        format.html { redirect_to @statusobra, notice:  "Status de obra foi atualizado com sucesso."}
        format.json { render :show, status: :ok, location: @statusobra }
      else
        format.html { render :edit }
        format.json { render json: @statusobra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statusobras/1
  # DELETE /statusobras/1.json
  def destroy
    @statusobra.destroy
    respond_to do |format|
      format.html { redirect_to statusobras_url, notice: "Status foi apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statusobra
      @statusobra = Statusobra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statusobra_params
      params.require(:statusobra).permit(:statusobra_type)
    end
end
