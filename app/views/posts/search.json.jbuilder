json.array! @posts do |post|
  json.id post.id
  json.content post.content
  json.prefecture post.prefecture_id
  json.title post.title
  json.content post.content
end
