# frozen_string_literal: true

class Building < ActiveRecord::Base

  validates_presence_of :building_type, :message => "Campo obrigatório"

  has_many :departments
  has_many :requests
  has_many :informativo_obras

  has_many :atendimentos, dependent: :destroy
  accepts_nested_attributes_for :atendimentos, allow_destroy: true
end
