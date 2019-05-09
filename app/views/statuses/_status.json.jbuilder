# frozen_string_literal: true

json.extract! status, :id, :status_type, :created_at, :updated_at
json.url status_url(status, format: :json)
