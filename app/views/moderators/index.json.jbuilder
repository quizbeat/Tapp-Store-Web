json.array!(@moderators) do |moderator|
  json.extract! moderator, :id
  json.url moderator_url(moderator, format: :json)
end
