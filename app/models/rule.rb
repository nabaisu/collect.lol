class Rule < ApplicationRecord
  belongs_to :zone
  belongs_to :collectible
  belongs_to :stickerbook
end
