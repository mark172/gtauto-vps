require 'test_helper'

class TrackingsControllerTest < ActionController::TestCase
  setup do
    @tracking = trackings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracking" do
    assert_difference('Tracking.count') do
      post :create, tracking: { destination_city: @tracking.destination_city, destination_state: @tracking.destination_state, destination_zip: @tracking.destination_zip, email: @tracking.email, first_name: @tracking.first_name, last_name: @tracking.last_name, make: @tracking.make, model: @tracking.model, order_number: @tracking.order_number, origin_city: @tracking.origin_city, origin_state: @tracking.origin_state, origin_zip: @tracking.origin_zip, phone: @tracking.phone, pick_up_date: @tracking.pick_up_date, year: @tracking.year }
    end

    assert_redirected_to tracking_path(assigns(:tracking))
  end

  test "should show tracking" do
    get :show, id: @tracking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracking
    assert_response :success
  end

  test "should update tracking" do
    patch :update, id: @tracking, tracking: { destination_city: @tracking.destination_city, destination_state: @tracking.destination_state, destination_zip: @tracking.destination_zip, email: @tracking.email, first_name: @tracking.first_name, last_name: @tracking.last_name, make: @tracking.make, model: @tracking.model, order_number: @tracking.order_number, origin_city: @tracking.origin_city, origin_state: @tracking.origin_state, origin_zip: @tracking.origin_zip, phone: @tracking.phone, pick_up_date: @tracking.pick_up_date, year: @tracking.year }
    assert_redirected_to tracking_path(assigns(:tracking))
  end

  test "should destroy tracking" do
    assert_difference('Tracking.count', -1) do
      delete :destroy, id: @tracking
    end

    assert_redirected_to trackings_path
  end
end
