# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)

      cookies.encrypted[:jwt] = {
        value: token,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :lax,
        expires: 24.hours.from_now
      }

      render json: { user: user.to_h }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:jwt)
    render json: { message: "Logged out successfully" }
  end
end
