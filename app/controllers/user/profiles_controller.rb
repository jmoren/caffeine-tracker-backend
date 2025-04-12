# frozen_string_literal: true

class User::ProfilesController < ApplicationController
  def profile
    render json: { user: current_user.to_h }
  end

  def update
    puts "paras: #{user_params}"
    if current_user.update(user_params)
      render json: { user: current_user.to_h }
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_content
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, user_configuration_attributes: [:threshold, :max_per_day])
  end
end
