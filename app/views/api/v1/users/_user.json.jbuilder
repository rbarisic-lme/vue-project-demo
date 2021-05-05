json.extract! user,
  :id,
  :role,
  :type,
  :first_name,
  :last_name,
  :street,
  :city,
  :zipcode,
  :country,
  :initials,
  :created_at,
  :updated_at

json.avatar_url url_for(user.avatar) if user.avatar.attached?
# json.url api_v1_user_url(user, format: :json)