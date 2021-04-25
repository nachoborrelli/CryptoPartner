class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = current_user.wallet.transactions

  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @selectiveCoins = get_selective_coins()
  end

  # # GET /transactions/1/edit
  # def edit
  # end

  # POST /transactions or /transactions.json
  def create
    @selectiveCoins = get_selective_coins()

    cb = Coin.create_from_api(transaction_params["CB_apikey"])
    cs = Coin.create_from_api(transaction_params["CS_apikey"])

    puts cb,cs

    @transaction = Transaction.new(transaction_params.merge(wallet_id: current_user.wallet.id, CBought_id: cb, CSold_id: cs))

    puts @transaction

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def get_selective_coins()
    response = Excon.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false")
    return nil if response.status != 200
    totalInformation =  JSON.parse(response.body)
    coins = []
    totalInformation.each {|coin| coins.push([coin["name"], coin["id"]])}
    return coins
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.fetch(:transaction, {}).permit('wallet_id', 'CB_apikey','CB_value', 'CB_amount', 'CS_apikey', 'CS_value', 'CS_amount', 'date')
    end
end
