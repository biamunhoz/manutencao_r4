class Usuario < ActiveRecord::Base

  has_many :requests
  has_many :comentarios
  has_many :atendimentos
  has_many :avisos

  has_many :tipo_vinculos
  has_many :logs

  has_many :permitidos
  has_many :perfils, through: :permitidos
end
