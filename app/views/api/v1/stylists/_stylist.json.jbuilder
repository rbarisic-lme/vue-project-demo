json.extract! stylist,
  :id,
  :role,
  :type,
  :stylist_tutorial_read,
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
  :service_mobility,
  :service_radius,
  :service_package_basic_hair_price,
  :service_package_basic_makeup_price,
  :service_package_standard_price,
  :service_package_premium_price,
  :sustainable_materials_percent,
  :workspace_street,
  :workspace_city,
  :workspace_zipcode,
  :workspace_country,
  :invoice_mandate_accepted

json.available_extras stylist.available_extras

json.ready_for_kyc stylist.ready_for_kyc?

json.avatar_url url_for(stylist.avatar) if stylist.avatar.attached?
json.url api_v1_stylist_url(stylist, format: :json)

