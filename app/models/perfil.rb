class Perfil < ActiveRecord::Base

  validates_presence_of :tipo, :message => "Campo obrigatório"

  has_many :permitidos
  has_many :usuarios, through: :permitidos

end
