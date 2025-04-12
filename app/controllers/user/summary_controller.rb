class User::SummaryController < ApplicationController
  def index
    service = ::SummaryService.new(current_user, params[:start_date], params[:end_date]).call
    if service.success?
      render json: { summary: service.summary }
    else
      render json: { error: service.error }, status: 422
    end
  end
end
