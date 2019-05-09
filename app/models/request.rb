# frozen_string_literal: true

class Request < ActiveRecord::Base

  validates_presence_of :subject, :request_local, :problem_description, :message => "Campo obrigatório"

  belongs_to :usuario
  belongs_to :status
  belongs_to :category
  belongs_to :building
  belongs_to :department

  has_many :comentarios, dependent: :destroy
  accepts_nested_attributes_for :comentarios, allow_destroy: true

  mount_uploader :foto1, Foto1Uploader
  mount_uploader :foto2, Foto2Uploader
  mount_uploader :foto3, Foto3Uploader

  validates :problem_description, length: { maximum: 5000 }, presence: true




end
