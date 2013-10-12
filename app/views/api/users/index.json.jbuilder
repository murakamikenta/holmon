json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :access_token, :image
  json.url api_user_url(user)
end
