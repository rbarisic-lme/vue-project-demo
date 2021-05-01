json.extract! bank_account,
  :id,
  :created_at,
  :updated_at,
  :full_name,
  :street,
  :zipcode,
  :city,
  :country,
  :bic

json.iban bank_account.iban # if bank_account.iban.present? # && can_view_iban

# json.url bank_account_url(bank_account, format: :json)