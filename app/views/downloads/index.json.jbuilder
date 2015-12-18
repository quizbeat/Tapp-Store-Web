json.array!(@downloads) do |download|
  json.extract! download, :id, :app_id, :person_id, :download_date
  json.url download_url(download, format: :json)
end
