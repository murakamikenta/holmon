json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :body
  json.url api_post_url(post)
end
