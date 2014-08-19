class RefundsController < ApplicationController
  before_action :set_refund, only: [:show, :edit, :update, :destroy]

  # GET /refunds
  # GET /refunds.json
  def index
    @search = Refund.search(params[:q])
    @refunds = @search.result
  end

  # GET /refunds/1
  # GET /refunds/1.json
  def show
  end

  # GET /refunds/new
  def new
    @refund = Refund.new
    @refund.line_items.build
  end

  # GET /refunds/1/edit
  def edit
  end

  # POST /refunds
  # POST /refunds.json
  def create
    @refund = Refund.new(refund_params)
    @refund.created_by = current_user

    respond_to do |format|
      if @refund.save
        format.html { redirect_to @refund, notice: 'Refund was successfully created.' }
        format.json { render :show, status: :created, location: @refund }
      else
        format.html { render :new }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refunds/1
  # PATCH/PUT /refunds/1.json
  def update
    respond_to do |format|
      if @refund.update(refund_params)
        format.html { redirect_to @refund, notice: 'Refund was successfully updated.' }
        format.json { render :show, status: :ok, location: @refund }
      else
        format.html { render :edit }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refunds/1
  # DELETE /refunds/1.json
  def destroy
    @refund.destroy
    respond_to do |format|
      format.html { redirect_to refunds_url, notice: 'Refund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refund
      @refund = Refund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refund_params
      params.require(:refund).permit(:number, :total, :state, :customer_id, 
                                    :completed_at, :created_by_id, line_items_attributes: [:id, :product_id, :quantity, :_destroy])
    end
end
