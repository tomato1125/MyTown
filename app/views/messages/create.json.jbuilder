json.text @message.message
json.user_id @message.user.id
json.user_name @message.user.name
json.user_image @message.user.image.url
json.created_at @message.created_at.strftime("%Y-%m-%d %H:%M")