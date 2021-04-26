class WalletCoinsController < ApplicationController
  before_action :set_wallet_coin, only: %i[ show edit update destroy ]
  
  # GET /wallet_coins or /wallet_coins.json
  def index
    @wallet_coins = current_user.wallet.wallet_coins
  end

  # GET /wallet_coins/1 or /wallet_coins/1.json
  def show
  end

  # GET /wallet_coins/new
  def new
    @wallet_coin = WalletCoin.new
  end

  # GET /wallet_coins/1/edit
  def edit
  end

  # POST /wallet_coins or /wallet_coins.json
  def create
    coin = Coin.create_from_api(wallet_coin_params["coin_apikey"])
    new_wallet_coin_params = wallet_coin_params.merge(wallet_id: current_user.wallet.id, coin_id: coin).except(:coin_apikey)
    @wallet_coin = WalletCoin.new(new_wallet_coin_params)

    respond_to do |format|
      if @wallet_coin.save
        format.html { redirect_to @wallet_coin, notice: "Wallet coin was successfully created." }
        format.json { render :show, status: :created, location: @wallet_coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_usd
    new_wallet_coin_params = wallet_coin_params.merge(wallet_id: current_user.wallet.id, coin_id: Coin.usd.id).except(:coin_apikey)
    @wallet_coin = WalletCoin.new(new_wallet_coin_params)

    respond_to do |format|
      if @wallet_coin.save
        format.html { redirect_to @wallet_coin, notice: "Wallet coin was successfully created." }
        format.json { render :show, status: :created, location: @wallet_coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallet_coins/1 or /wallet_coins/1.json
  def update
    respond_to do |format|
      if @wallet_coin.update(wallet_coin_params)
        format.html { redirect_to @wallet_coin, notice: "Wallet coin was successfully updated." }
        format.json { render :show, status: :ok, location: @wallet_coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wallet_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallet_coins/1 or /wallet_coins/1.json
  def destroy
    @wallet_coin.destroy
    respond_to do |format|
      format.html { redirect_to wallet_coins_url, notice: "Wallet coin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet_coin
      @wallet_coin = WalletCoin.find(params[:id])
      @selectiveCoins = Coin.get_selective_coins()
    end

    # Only allow a list of trusted parameters through.
    def wallet_coin_params
      params.fetch(:wallet_coin, {}).permit('wallet_id', 'coin_apikey','amount')
    end
end
