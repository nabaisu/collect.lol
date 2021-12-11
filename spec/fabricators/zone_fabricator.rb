Fabricator(:zone) do
  kind        Faker::Lorem.word
  name        Faker::Space.nebula
  code        Faker::Config.locale
  capital     Faker::Space.star
  subregion   Faker::Space.galaxy
  childs_type Faker::Lorem.word
end