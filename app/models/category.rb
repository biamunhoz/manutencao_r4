# frozen_string_literal: true

class Category < ActiveRecord::Base

  validates_presence_of :category_type, :message => "Campo obrigatório"

  has_many :requests

end

