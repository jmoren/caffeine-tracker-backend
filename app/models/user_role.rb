class UserRole < ApplicationRecord
  belongs_to :user

  enum :role, { user: 0, admin: 1 }
end
