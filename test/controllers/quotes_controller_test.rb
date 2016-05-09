require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: { description: @quote.description, destination_city: @quote.destination_city, destination_state: @quote.destination_state, destination_zip: @quote.destination_zip, email: @quote.email, first_name: @quote.first_name, is_operable: @quote.is_operable, last_name: @quote.last_name, make: @quote.make, model: @quote.model, origin_city: @quote.origin_city, origin_state: @quote.origin_state, origin_zip: @quote.origin_zip, phone: @quote.phone, pick_up_date: @quote.pick_up_date, year: @quote.year }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    patch :update, id: @quote, quote: { description: @quote.description, destination_city: @quote.destination_city, destination_state: @quote.destination_state, destination_zip: @quote.destination_zip, email: @quote.email, first_name: @quote.first_name, is_operable: @quote.is_operable, last_name: @quote.last_name, make: @quote.make, model: @quote.model, origin_city: @quote.origin_city, origin_state: @quote.origin_state, origin_zip: @quote.origin_zip, phone: @quote.phone, pick_up_date: @quote.pick_up_date, year: @quote.year }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
