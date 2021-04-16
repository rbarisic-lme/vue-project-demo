json.extract! stylist, :id, :first_name, :last_name, :street, :city, :zipcode, :country, :about_me, :initials, :brands, :languages, :created_at, :updated_at, :service_radius
json.avatar_url url_for(stylist.avatar) if stylist.avatar.attached?
json.url api_v1_stylist_url(stylist, format: :json)