Fabricator(:collectible) do
  kind        Faker::Lorem.word
  title       Faker::Lorem.sentence
  description Faker::Lorem.sentence(word_count: 33)
  photo       Faker::File.file_name
  icon        Faker::File.file_nam
end