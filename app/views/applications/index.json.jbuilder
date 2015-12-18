json.array!(@applications) do |application|
  json.extract! application, :id, :app_name, :description, :category_id, :price, :app_version, :app_size, :status, :developer_id
  json.url application_url(application, format: :json)
end
