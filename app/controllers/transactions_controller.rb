class TransactionsController < ApplicationController
  before_action :set_source
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @search = @source.source_transactions.search(params[:q])
    @transactions = @search.result
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = @source.source_transactions.build
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = @source.source_transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to polymorphic_path([@source, :transactions]), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to polymorphic_path([@source, :transactions]), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@source, :transactions]), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      params.collect do |name, value|
        @source = $1.classify.constantize.find(value) if name =~ /(.+)_id$/
      end
    end

    def set_destination
      return if params[:destination_type].blank?
      @destination = params[:destination_type].capitalize.constantize.find(params[:destination_id])
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :source_id, :destination_id, :destination_type, :date)
    end
end
