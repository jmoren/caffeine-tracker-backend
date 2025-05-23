class UserDrink < ApplicationRecord
  belongs_to :drink
  belongs_to :user

  enum :level, { full: 0, half: 1, some: 2  }

  validates :drink_id, :user_id, presence: true

  def to_h
    {
      id: self.id,
      level: self.level,
      drink: { name: self.drink.name, description: self.drink.description, caffeine: self.drink.caffeine },
      consumed_at: self.consumed_at,
      created_at: self.created_at
    }
  end
end
