class User::UserDrinksController < ApplicationController
  before_action :set_user_drink, only: %i[ show update destroy ]

  # GET /user_drinks
  def index
    user_drinks = current_user.user_drinks.order(consumed_at: :desc)
    grouped = user_drinks.group_by { |record| record.consumed_at.to_date }
    parsed_data = grouped.transform_values { |records| records.map(&:to_json) }
    render json: parsed_data
  end

  # GET /user_drinks/1
  def show
    render json: @user_drink.to_json
  end

  # POST /user_drinks
  def create
    @user_drink = current_user.user_drinks.new(user_drink_params)

    if @user_drink.save
      render json: @user_drink.to_json, status: :created
    else
      render json: @user_drink.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_drinks/1
  def update
    if @user_drink.update(user_drink_params)
      render json: @user_drink.to_json
    else
      render json: @user_drink.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_drinks/1
  def destroy
    @user_drink.destroy!
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user_drink
      @user_drink = current_user.user_drinks.find(params.expect(:drink_id))
    end

    # Only allow a list of trusted parameters through.
    def user_drink_params
      params.expect(user_drink: [ :drink_id, :user_id, :level, :consumed_at ])
    end
end
