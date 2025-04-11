class User < ApplicationRecord
  has_secure_password

  has_many :user_drinks
  has_many :user_roles
  has_one :user_configuration

  after_create :add_default_config


  def authenticate_with_jwt(token)
    JWT.decode(toke, Rails.application.credentials.secret_key_base, [ "HS256" ])
  end

  private

  def add_default_config
    create_user_configuration
  end
end
