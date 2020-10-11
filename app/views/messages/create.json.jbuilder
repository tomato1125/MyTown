json.text @message.message
json.user_id @message.user.id
json.user_name @message.user.name
json.user_image @message.user.image.url
json.date @message.created_at.strftime