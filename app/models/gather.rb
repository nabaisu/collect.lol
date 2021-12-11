class Gather < ApplicationRecord
  belongs_to :user
  belongs_to :stickerbook
  belongs_to :zone
end
