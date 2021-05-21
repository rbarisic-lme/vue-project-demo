json.extract! portfolio_image, :id, :user_id, :created_at, :updated_at

json.image_url url_for(portfolio_image.image) if portfolio_image.image.attached?
