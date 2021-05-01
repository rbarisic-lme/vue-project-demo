json.extract! stylist,
  :id,
  :first_name,
  :last_name,
  :street,
  :city,
  :zipcode,
  :country,
  :about_me,
  :initials,
  :brands,
  :languages,
  :created_at,
  :updated_at,
  :service_radius,
  :service_package_basic_hair_price,
  :service_package_basic_makeup_price,
  :service_package_standard_price,
  :service_package_premium_price

json.avatar_url url_for(stylist.avatar) if stylist.avatar.attached?
json.url api_v1_stylist_url(stylist, format: :json)