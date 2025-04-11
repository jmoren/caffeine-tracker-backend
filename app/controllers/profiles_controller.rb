# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    render json: { user: { email: current_user.email, username: current_user.username, roles: current_user.user_roles.map(&:role) } }
  end
end
