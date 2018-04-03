class ItemInfo < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient

  validates :item, presence: true, uniqueness: { scope: :ingredient }
end
