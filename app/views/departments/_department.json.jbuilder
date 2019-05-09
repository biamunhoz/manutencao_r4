# frozen_string_literal: true

json.extract! department, :id, :department_type, :building_id, :created_at, :updated_at
json.url department_url(department, format: :json)
