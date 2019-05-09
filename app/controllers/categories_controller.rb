# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_filter 'autenticado?', 'tempermissao?'
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.where(:desativado => false)
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      addlog("Cadastrou um nova categoria")
      redirect_to @category, notice: "Categoria criada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      addlog("Atualizou um categoria")
      redirect_to @category, notice: "Categoria atualizada com sucesso."
    else
      render :edit
    end
  end

  def desativacat

    set_category

    @category.desativado = true
    @category.save

    addlog("Desativou uma categoria")

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Status desativado com sucesso.'}
    end

  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Categoria apagada com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:category_type, :desativado)
    end
end
