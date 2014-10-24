json.array!(@sms) do |sm|
  json.extract! sm, :id, :name, :uri, :last_status, :last_status_date, :last_post
  json.url sm_url(sm, format: :json)
end
