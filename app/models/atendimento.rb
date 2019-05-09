class Atendimento < ActiveRecord::Base

  belongs_to :building
  belongs_to :usuario

end
