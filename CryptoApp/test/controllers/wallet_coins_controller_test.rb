require "test_helper"

class WalletCoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wallet_coin = wallet_coins(:one)
  end

  test "should get index" do
    get wallet_coins_url
    assert_response :success
  end

  test "should get new" do
    get new_wallet_coin_url
    assert_response :success
  end

  test "should create wallet_coin" do
    assert_difference('WalletCoin.count') do
      post wallet_coins_url, params: { wallet_coin: {  } }
    end

    assert_redirected_to wallet_coin_url(WalletCoin.last)
  end

  test "should show wallet_coin" do
    get wallet_coin_url(@wallet_coin)
    assert_response :success
  end

  test "should get edit" do
    get edit_wallet_coin_url(@wallet_coin)
    assert_response :success
  end

  test "should update wallet_coin" do
    patch wallet_coin_url(@wallet_coin), params: { wallet_coin: {  } }
    assert_redirected_to wallet_coin_url(@wallet_coin)
  end

  test "should destroy wallet_coin" do
    assert_difference('WalletCoin.count', -1) do
      delete wallet_coin_url(@wallet_coin)
    end

    assert_redirected_to wallet_coins_url
  end
end
