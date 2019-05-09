class Aviso < ActiveRecord::Base

  belongs_to :usuario

  validates_presence_of :descricao, :message => "Campo obrigatório"

end
