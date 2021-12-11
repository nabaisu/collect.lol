Collectible.destroy_all
Stickerbook.destroy_all
Rule.destroy_all
Zone.destroy_all
User.destroy_all

number_of_collectibles = 100
number_of_stickerbooks = 5
number_of_rules = 50
number_of_zones = 25
number_of_users = 7

number_of_collectibles.times do |_index|
  Collectible.create(
    kind: Faker::Lorem.word,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence(word_count: 33),
    photo: Faker::File.file_name,
    icon: Faker::File.file_name
  )
end

number_of_stickerbooks.times do |_index|
  Stickerbook.create(
    title: Faker::Lorem.sentence
  )
end

number_of_zones.times do |_index|
  Zone.create(
    kind: Faker::Lorem.word,
    name: Faker::Space.nebula,
    code: Faker::Config.locale,
    capital: Faker::Space.star,
    subregion: Faker::Space.galaxy,
    childs_type: Faker::Lorem.word
  )
end

number_of_rules.times do |_index|
  Rule.create(
    condition_type: Faker::Lorem.word,
    condition: Faker::Lorem.word,
    stickerbook: Stickerbook.limit(1).offset(rand(number_of_stickerbooks)).first,
    collectible: Collectible.limit(1).offset(rand(number_of_collectibles)).first,
    zone: Zone.limit(1).offset(rand(number_of_zones)).first
  )
end

number_of_users.times do |_index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: Faker::Lorem.word,
    email: Faker::Internet.email,
    gender: Faker::Lorem.word,
    login: Faker::Internet.user_name,
    phone: Faker::PhoneNumber.phone_number,
    phone_country_code: Faker::PhoneNumber.area_code,
    is_anon: Faker::Boolean.boolean,
    active: Faker::Boolean.boolean,
    deactivated_reason: Faker::Lorem.sentence,
    email_confirmed: Faker::Boolean.boolean,
    phone_confirmed: Faker::Boolean.boolean,
    account_verified: Faker::Boolean.boolean,
    account_verified_time: 6.days.ago,
    last_login_at: 2.days.ago
  )
end
