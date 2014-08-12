class StockTransfersController < ApplicationController
  before_action :set_stock_transfer, only: [:show, :edit, :update, :destroy]

  # GET /stock_transfers
  # GET /stock_transfers.json
  def index
    @search = StockTransfer.search(params[:q])
    @stock_transfers = @search.result
  end

  # GET /stock_transfers/1
  # GET /stock_transfers/1.json
  def show
  end

  # GET /stock_transfers/new
  def new
    @stock_transfer = StockTransfer.new
  end

  # GET /stock_transfers/1/edit
  def edit
  end

  # POST /stock_transfers
  # POST /stock_transfers.json
  def create
    @stock_transfer = StockTransfer.new(stock_transfer_params)

    respond_to do |format|
      if @stock_transfer.save
        format.html { redirect_to @stock_transfer, notice: 'Stock transfer was successfully created.' }
        format.json { render :show, status: :created, location: @stock_transfer }
      else
        format.html { render :new }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_transfers/1
  # PATCH/PUT /stock_transfers/1.json
  def update
    respond_to do |format|
      if @stock_transfer.update(stock_transfer_params)
        format.html { redirect_to @stock_transfer, notice: 'Stock transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_transfer }
      else
        format.html { render :edit }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_transfers/1
  # DELETE /stock_transfers/1.json
  def destroy
    @stock_transfer.destroy
    respond_to do |format|
      format.html { redirect_to stock_transfers_url, notice: 'Stock transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_transfer
      @stock_transfer = StockTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_transfer_params
      params.require(:stock_transfer).permit(:source_id, :variant_id, :quantity, :date)
    end
end
