json.array!(@publication_requests) do |publication_request|
  json.extract! publication_request, :id, :app_id, :moderator_id, :status, :request_date
  json.url publication_request_url(publication_request, format: :json)
end
