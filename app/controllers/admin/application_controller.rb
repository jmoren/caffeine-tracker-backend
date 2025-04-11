class Admin::ApplicationController < ::ApplicationController
  before_action :authorize_user


  def authorize_user
    unless current_user.roles.include?("admin")
      render json: { error: "Forbidden to access" }, status: :forbidden
    end
  end
end
