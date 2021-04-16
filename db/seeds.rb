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

# Stylist
Stylist.create!(
  email: "stylist@example.com",
  password: "alpine123",
  password_confirmation: "alpine123",
  first_name: "Testman",
  last_name: "Examplesson",
)

# Populate Brands

begin
  brands_file = File.read Rails.root.join('app', 'javascript', 'vue', 'data' '/brands.json')

  JSON.parse(brands_file).each do |brand_name|
    pp Brand.create!(name: brand_name)
  end
end

begin
  languages_file = File.read Rails.root.join('app', 'javascript', 'vue', 'data' '/languages.json')

  JSON.parse(languages_file).each do |language|
    pp Language.create!(name: language["name"])
  end
end

pp "DB Seeded."