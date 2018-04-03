class City < ApplicationRecord
  belongs_to :state
  validates :name, presence: true, uniqueness: { scope: :state }
  validates :state, presence: true
end
