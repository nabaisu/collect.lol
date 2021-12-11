Fabricator(:gather) do
  time_when         Faker::Lorem.sentence
  how               Faker::Lorem.sentence
  link              Faker::Lorem.sentence
  extra_information Faker::Lorem.sentence
  description       Faker::Lorem.sentence
  condition         Faker::Lorem.word
end