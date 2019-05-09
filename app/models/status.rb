# frozen_string_literal: true

class Status < ActiveRecord::Base

  validates_presence_of :status_type, :message => "Campo obrigatório"

  has_many :requests
end
