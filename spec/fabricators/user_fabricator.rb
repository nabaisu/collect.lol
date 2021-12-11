Fabricator(:user) do
  first_name            Faker::Name.first_name
  last_name             Faker::Name.last_name
  photo                 Faker::File.file_name
  email                 Faker::Internet.email
  gender                Faker::Lorem.word
  login                 Faker::Internet.user_name
  phone                 Faker::PhoneNumber.phone_number
  phone_country_code    Faker::PhoneNumber.area_code
  active                Faker::Boolean.boolean
  deactivated_reason    Faker::Lorem.sentence
  email_confirmed       Faker::Boolean.boolean
  phone_confirmed       Faker::Boolean.boolean
  account_verified      Faker::Boolean.boolean
  account_verified_time 6.days.ago
  last_login_at         2.days.ago
end