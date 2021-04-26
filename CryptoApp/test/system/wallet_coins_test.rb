require "application_system_test_case"

class WalletCoinsTest < ApplicationSystemTestCase
  setup do
    @wallet_coin = wallet_coins(:one)
  end

  test "visiting the index" do
    visit wallet_coins_url
    assert_selector "h1", text: "Wallet Coins"
  end

  test "creating a Wallet coin" do
    visit wallet_coins_url
    click_on "New Wallet Coin"

    click_on "Create Wallet coin"

    assert_text "Wallet coin was successfully created"
    click_on "Back"
  end

  test "updating a Wallet coin" do
    visit wallet_coins_url
    click_on "Edit", match: :first

    click_on "Update Wallet coin"

    assert_text "Wallet coin was successfully updated"
    click_on "Back"
  end

  test "destroying a Wallet coin" do
    visit wallet_coins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wallet coin was successfully destroyed"
  end
end
