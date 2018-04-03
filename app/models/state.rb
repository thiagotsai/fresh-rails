class State < ApplicationRecord
  belongs_to :country
  validates :name, presence: true, uniqueness: { scope: :country }
  validates :country, presence: true
end
