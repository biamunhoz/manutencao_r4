class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include WelcomeHelper
  include LogsHelper

  def autenticado?

    if session[:login].blank?
      redirect_to root_path, notice: "Por favor, faça o login no sistema"
      return false
    end

  end

  def tempermissao?

    if session[:perfil] == "Comum" or session[:perfil] == "Técnico"
      redirect_to root_path
      return false
    end

  end

end
