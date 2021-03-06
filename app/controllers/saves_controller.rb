class SavesController < ApplicationController
  before_action :set_safe, only: [:show, :edit, :update, :destroy]

  # GET /saves
  # GET /saves.json
  def index
    @search = Safe.safe_only.search(params[:q])
    @saves = @search.result
  end

  # GET /saves/1
  # GET /saves/1.json
  def show
  end

  # GET /saves/new
  def new
    @safe = Safe.new
  end

  # GET /saves/1/edit
  def edit
  end

  # POST /saves
  # POST /saves.json
  def create
    @safe = Safe.new(safe_params)

    respond_to do |format|
      if @safe.save
        format.html { redirect_to saves_path, notice: 'Safe was successfully created.' }
        format.json { render :show, status: :created, location: @safe }
      else
        format.html { render :new }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saves/1
  # PATCH/PUT /saves/1.json
  def update
    respond_to do |format|
      if @safe.update(safe_params)
        format.html { redirect_to saves_path, notice: 'Safe was successfully updated.' }
        format.json { render :show, status: :ok, location: @safe }
      else
        format.html { render :edit }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saves/1
  # DELETE /saves/1.json
  def destroy
    @safe.destroy
    respond_to do |format|
      format.html { redirect_to saves_url, notice: 'Safe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safe
      @safe = Safe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safe_params
      params.require(:safe).permit(:name, :type, :account_number)
    end
end
