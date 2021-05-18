# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Regular User
# User.create(
#   email: 'user@example.com',
#   password: 'alpine123',
#   password_confirmation: 'alpine123',
#   first_name: 'User',
#   last_name: 'Testmann',
  
#   street: 'Teststreet 2',
#   city: 'Testhausen',
#   zipcode: '60322',
#   country: 'Germany',

#   phone: '+49 1573 469 1880',
#   # street_invoice: 'Teststreet 2',
#   # city_invoice: 'Testhausen',
#   # zipcode_invoice: '60322',
#   # country_invoice: 'Germany',

#   # separate_invoice_address: true,
#   # kyc_documents: [],
#   # kyc_completed: false
# )

# Bride
User.create!(
  email: "bride@example.com",
  password: "alpine123",
  password_confirmation: "alpine123",
  first_name: "Testman",
  last_name: "Examplesson",
  role: 'bride'
)

User.create!(
  email: 'admin@example.com',
  password: 'alpine123',
  password_confirmation: 'alpine123',
  first_name: 'Admin',
  last_name: 'bridlx',
  role: 'admin',
)

# Stylist
stylist = Stylist.create!(
  email: "stylist@example.com",
  password: "alpine123",
  password_confirmation: "alpine123",
  first_name: "Testman",
  last_name: "Examplesson",
  role: 'stylist'
)

stylist.reviews.create!(
  author: 'Hannelore Frank',
  email: 'hanni@lore.com',
  rating_quality: 5,
  rating_timeliness: 5,
  rating_communication: 5,
  body: 'Ich war mit den angebotenen Services sehr zufrieden! Meine Hochzeitsbilder sehen prima aus.'
)

stylist.reviews.create!(
  author: 'Majke Muckelbaum',
  email: 'majke@schermajke.de',
  rating_quality: 5,
  rating_timeliness: 3,
  rating_communication: 5,
  body: 'Der Stylist kam etwas zu spät, aber die Arbeit war top!'
)

# Static Pages content

StaticPage.create!(title: 'imprint', body: File.read(Rails.root.join('app', 'javascript', 'vue', 'data' '/markdown/imprint.md')))
StaticPage.create!(title: 'terms', body: File.read(Rails.root.join('app', 'javascript', 'vue', 'data' '/markdown/terms.md')))
StaticPage.create!(title: 'privacy', body: File.read(Rails.root.join('app', 'javascript', 'vue', 'data' '/markdown/privacy.md')))
StaticPage.create!(title: 'about_us')
StaticPage.create!(title: 'mangopay_terms')
# Populate Brands

begin
  extras_file = File.read Rails.root.join('app', 'javascript', 'vue', 'data' '/service_extras.json')

  JSON.parse(extras_file).each do |extra|
    pp ServiceExtra.create!(name: extra["label"], requires_trial_date: extra["requires_trial_date"])
  end
end


begin
  languages_file = File.read Rails.root.join('app', 'javascript', 'vue', 'data' '/languages.json')

  JSON.parse(languages_file).each do |language|
    pp Language.create!(name: language["name"])
  end
end

begin
  brands_file = File.read Rails.root.join('app', 'javascript', 'vue', 'data' '/brands.json')

  JSON.parse(brands_file).each do |brand_name|
    pp Brand.create!(name: brand_name)
  end
end

pp "DB Seeded."