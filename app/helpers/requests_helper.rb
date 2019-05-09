# frozen_string_literal: true

module RequestsHelper

  def tecnicodesignado(tecnico)

    @tecnico = Usuario.where(:id => tecnico)

    if @tecnico.blank?
      @tecnicodesignado = " "
    else
      @tecnico.each do |tec|
        @tecnicodesignado = tec.nomeUsuario
      end
    end

    return @tecnicodesignado

  end

end
