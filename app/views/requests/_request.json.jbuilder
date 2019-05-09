# frozen_string_literal: true

json.extract! request, :id, :subject, :request_local, :problem_description, :user_id, :category_id, :status_id, :building_id, :created_at, :updated_at
json.url request_url(request, format: :json)
