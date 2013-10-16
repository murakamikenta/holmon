json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :body
 json.url api_user_post_url(1, post)
end
