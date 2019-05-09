# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_filter 'autenticado?', 'tempermissao?'
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  def index
    @departments = Department.where(:desativado => false)
  end

  # GET /departments/1
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      addlog("Cadastrou um novo departamento")
      redirect_to @department, notice: "Departamento foi criado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      addlog("Atualizou um departamento")
      redirect_to @department, notice: "Departamento foi atualizado com sucesso."
    else
      render :edit
    end
  end

  def desativadep

    set_department

    @department.desativado = true
    @department.save

    addlog("Desativou um departamento")

    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Departamento desativado com sucesso.'}
    end

  end

  # DELETE /departments/1
  def destroy
    @department.destroy
    redirect_to departments_url, notice: "Departamento foi apagado com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def department_params
      params.require(:department).permit(:department_type, :building_id, :desativado)
    end
end
