# frozen_string_literal: true

class BuildingsController < ApplicationController
  before_filter 'autenticado?', 'tempermissao?'
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  before_action :set_tecnicos, only: [:new, :edit]

  # GET /buildings
  def index
    @buildings = Building.where(:desativado => false)
  end

  # GET /buildings/1
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
    @building.atendimentos.build if @building.atendimentos.empty?

  end

  # GET /buildings/1/edit
  def edit
    @building.atendimentos.build if @building.atendimentos.empty?
  end

  # POST /buildings
  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to @building, notice: "Prédio criado com sucesso."
      addlog("Cadastrou um novo prédio")
    else
      render :new
    end
  end

  # PATCH/PUT /buildings/1
  def update
    if @building.update(building_params)
      redirect_to @building, notice: "Prédio atualizado com sucesso."
      addlog("Atualizou um prédio")
    else
      render :edit
    end
  end


  def desativab

    set_building

    @building.desativado = true
    @building.save

    addlog("Desativou um prédio")

    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Prédio desativado com sucesso.'}
    end

  end

  # DELETE /buildings/1
  def destroy

    @building.destroy

    redirect_to buildings_url, notice: "Prédio apagado com sucesso."
  end

  def set_tecnicos
    @tecnicos =  Usuario.joins(:permitidos).where(" permitidos.perfil_id = 2")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_params
      params.require(:building).permit(:building_type, :desativado, atendimentos_attributes:[:id, :building_id, :usuario_id, :_destroy])
    end
end
