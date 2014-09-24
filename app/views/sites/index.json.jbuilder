json.array!(@sites) do |site|
  json.extract! site, :id, :name, :uri, :last_status, :last_status_date, :last_post
  json.url site_url(site, format: :json)
end
