require "test_helper"

class UserDrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_drink = user_drinks(:one)
  end

  test "should get index" do
    get user_drinks_url, as: :json
    assert_response :success
  end

  test "should create user_drink" do
    assert_difference("UserDrink.count") do
      post user_drinks_url, params: { user_drink: { consumed_at: @user_drink.consumed_at, drink_id: @user_drink.drink_id, level: @user_drink.level, user_id: @user_drink.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_drink" do
    get user_drink_url(@user_drink), as: :json
    assert_response :success
  end

  test "should update user_drink" do
    patch user_drink_url(@user_drink), params: { user_drink: { consumed_at: @user_drink.consumed_at, drink_id: @user_drink.drink_id, level: @user_drink.level, user_id: @user_drink.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_drink" do
    assert_difference("UserDrink.count", -1) do
      delete user_drink_url(@user_drink), as: :json
    end

    assert_response :no_content
  end
end
