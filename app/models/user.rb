class User < ApplicationRecord
  has_secure_password

  has_many :user_drinks
  has_many :user_roles
  has_one :user_configuration

  after_create :add_default_config

  accepts_nested_attributes_for :user_configuration, update_only: true

  def admin?
    user_roles.map(&:role).include?("admin")
  end

  def authenticate_with_jwt(token)
    JWT.decode(toke, Rails.application.credentials.secret_key_base, [ "HS256" ])
  end

  def to_h
    {
      email: self.email,
      username: self.username,
      roles: self.user_roles.map(&:role),
      config: self.user_configuration
    }
  end

  private

  def add_default_config
    create_user_configuration
  end
end
