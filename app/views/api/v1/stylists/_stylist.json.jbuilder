json.extract! stylist, :id, :first_name, :last_name, :initials, :brands, :created_at, :updated_at
json.avatar_url url_for(stylist.avatar) if stylist.avatar.attached?
json.url api_v1_stylist_url(stylist, format: :json)
