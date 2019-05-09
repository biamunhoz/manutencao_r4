# frozen_string_literal: true

class Department < ActiveRecord::Base

  validates_presence_of :department_type, :message => "Campo obrigatório"

  belongs_to :building

  has_many :requests

  has_many :users, as: :department, class_name: "Admin"
  has_many :users, as: :department, class_name: "Employee"
  has_many :users, as: :department, class_name: "Tecnical"
  has_many :users, as: :department, class_name: "Docent"
end
