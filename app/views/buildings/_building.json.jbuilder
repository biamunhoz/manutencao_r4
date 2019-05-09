# frozen_string_literal: true

json.extract! building, :id, :building_type, :created_at, :updated_at
json.url building_url(building, format: :json)
