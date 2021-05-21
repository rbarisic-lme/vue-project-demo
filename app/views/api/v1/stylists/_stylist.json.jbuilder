json.extract! stylist,
  :id,
  :md5_identifier,
  :role,
  :type,
  :profile_published,
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
  :invoice_mandate_accepted,
  :overall_ratings_detailed,
  :kyc_pending
  # :ratings_by_stars,
  # :overall_ratings

json.kyc_verified stylist.kyc_verified?

json.available_extras do
  json.array! stylist.available_extras, :id, :user_id, :service_extra_id, :price
end

json.skills do
  json.array! stylist.skills, :id, :user_id, :name, :level
end

json.certifications do
  json.array! stylist.certifications, :id, :title, :certified_by, :body, :start_date, :end_date, :created_at
end

json.reviews do
  json.array! stylist.reviews.slice(0,3), :id, :author, :body, :overall_rating_2f, :updated_at
end

json.portfolio_images stylist.portfolio_images do |pi|
  json.extract! pi, :id
  json.image_url url_for(pi.image) if pi.image.attached?
  # json.array! stylist.portfolio_images, :id, :image, :image_url
end

json.ready_for_kyc stylist.ready_for_kyc?

json.avatar_url url_for(stylist.avatar) if stylist.avatar.attached?
json.url api_v1_stylist_url(stylist, format: :json)