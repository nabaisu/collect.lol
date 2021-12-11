Fabricator(:rule) do
  condition_type Faker::Lorem.word
  condition      Faker::Lorem.word
  zone           nil
  stickerbook    nil
  collectible    nil
end