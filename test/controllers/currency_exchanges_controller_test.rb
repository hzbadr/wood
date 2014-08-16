require 'test_helper'

class CurrencyExchangesControllerTest < ActionController::TestCase
  setup do
    @currency_exchange = currency_exchanges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currency_exchanges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currency_exchange" do
    assert_difference('CurrencyExchange.count') do
      post :create, currency_exchange: { description: @currency_exchange.description, destination_amount: @currency_exchange.destination_amount, destination_id: @currency_exchange.destination_id, exchange_rate: @currency_exchange.exchange_rate, safe_id: @currency_exchange.safe_id, source_amount: @currency_exchange.source_amount, source_id: @currency_exchange.source_id }
    end

    assert_redirected_to currency_exchange_path(assigns(:currency_exchange))
  end

  test "should show currency_exchange" do
    get :show, id: @currency_exchange
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @currency_exchange
    assert_response :success
  end

  test "should update currency_exchange" do
    patch :update, id: @currency_exchange, currency_exchange: { description: @currency_exchange.description, destination_amount: @currency_exchange.destination_amount, destination_id: @currency_exchange.destination_id, exchange_rate: @currency_exchange.exchange_rate, safe_id: @currency_exchange.safe_id, source_amount: @currency_exchange.source_amount, source_id: @currency_exchange.source_id }
    assert_redirected_to currency_exchange_path(assigns(:currency_exchange))
  end

  test "should destroy currency_exchange" do
    assert_difference('CurrencyExchange.count', -1) do
      delete :destroy, id: @currency_exchange
    end

    assert_redirected_to currency_exchanges_path
  end
end
