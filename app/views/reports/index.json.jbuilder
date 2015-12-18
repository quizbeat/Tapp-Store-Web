json.array!(@reports) do |report|
  json.extract! report, :id, :reason, :description, :app_id, :status, :person_id, :moderator_id
  json.url report_url(report, format: :json)
end
