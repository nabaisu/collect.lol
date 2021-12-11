Fabricator(:stickerbook) do
  title      Faker::Lorem.sentence
  created_by Faker::Internet.user_name
end