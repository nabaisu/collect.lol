class Rule < ApplicationRecord
  belongs_to :zone, optional: true
  belongs_to :collectible
  belongs_to :stickerbook
end
