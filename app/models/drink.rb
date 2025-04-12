class Drink < ApplicationRecord
  has_many :user_drinks
  validates :caffeine, numericality: { greater_than_or_equal_to: 0 }
end
