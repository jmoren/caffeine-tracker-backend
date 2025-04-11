class Admin::DrinksController < Admin::ApplicationController
  before_action :set_drink, only: %i[ show update destroy ]
  skip_before_action :authorize_user, only: [ :index, :show ]

  # GET /drinks
  def index
    @drinks = Drink.all

    render json: @drinks
  end

  # GET /drinks/1
  def show
    render json: @drink
  end

  # POST /drinks
  def create
    @drink = Drink.new(drink_params)

    if @drink.save
      render json: @drink, status: :created, location: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drinks/1
  def update
    if @drink.update(drink_params)
      render json: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drinks/1
  def destroy
    @drink.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def drink_params
      params.expect(drink: [ :name, :description, :size, :caffeine, :image_url ])
    end
end
