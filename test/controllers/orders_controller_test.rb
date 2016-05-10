require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { amount_quoted: @order.amount_quoted, color: @order.color, date_first_available: @order.date_first_available, description: @order.description, destination_cell_phone: @order.destination_cell_phone, destination_city: @order.destination_city, destination_first_name: @order.destination_first_name, destination_home_phone: @order.destination_home_phone, destination_last_name: @order.destination_last_name, destination_state: @order.destination_state, destination_work_phone: @order.destination_work_phone, destination_zip: @order.destination_zip, email: @order.email, is_operable: @order.is_operable, is_oversied: @order.is_oversied, license_plate: @order.license_plate, make: @order.make, model: @order.model, origin_cell_phone: @order.origin_cell_phone, origin_city: @order.origin_city, origin_first_name: @order.origin_first_name, origin_home_phone: @order.origin_home_phone, origin_last_name: @order.origin_last_name, origin_state: @order.origin_state, origin_work_phone: @order.origin_work_phone, origin_zip: @order.origin_zip, payment: @order.payment, phone: @order.phone, quote_number: @order.quote_number, string: @order.string, todays_date: @order.todays_date, vin: @order.vin, year: @order.year }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { amount_quoted: @order.amount_quoted, color: @order.color, date_first_available: @order.date_first_available, description: @order.description, destination_cell_phone: @order.destination_cell_phone, destination_city: @order.destination_city, destination_first_name: @order.destination_first_name, destination_home_phone: @order.destination_home_phone, destination_last_name: @order.destination_last_name, destination_state: @order.destination_state, destination_work_phone: @order.destination_work_phone, destination_zip: @order.destination_zip, email: @order.email, is_operable: @order.is_operable, is_oversied: @order.is_oversied, license_plate: @order.license_plate, make: @order.make, model: @order.model, origin_cell_phone: @order.origin_cell_phone, origin_city: @order.origin_city, origin_first_name: @order.origin_first_name, origin_home_phone: @order.origin_home_phone, origin_last_name: @order.origin_last_name, origin_state: @order.origin_state, origin_work_phone: @order.origin_work_phone, origin_zip: @order.origin_zip, payment: @order.payment, phone: @order.phone, quote_number: @order.quote_number, string: @order.string, todays_date: @order.todays_date, vin: @order.vin, year: @order.year }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
