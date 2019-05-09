# frozen_string_literal: true

class StatusesController < ApplicationController
  before_filter 'autenticado?', 'tempermissao?'
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    @statuses = Status.where(:desativado => false)
  end

  # GET /statuses/1
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)

    if @status.save
      addlog("Cadastrou novo status")
      redirect_to @status, notice: "Status foi criado com sucesso."
    else
      render :new
    end
  end

  def desativasta

    set_status

    @status.desativado = true
    @status.save

    addlog("Desativou um status")

    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status desativado com sucesso.'}
    end

  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      addlog("Atualizou um status")
      redirect_to @status, notice: "Status foi atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
    redirect_to statuses_url, notice: "Status foi apagado com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:status_type)
    end
end
