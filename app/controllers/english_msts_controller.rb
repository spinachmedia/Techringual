class EnglishMstsController < ApplicationController
  before_action :set_english_mst, only: [:show, :edit, :update, :destroy]

  # GET /english_msts
  # GET /english_msts.json
  def index
    @english_msts = EnglishMst.all
  end

  # GET /english_msts/1
  # GET /english_msts/1.json
  def show
  end

  # GET /english_msts/new
  def new
    @english_mst = EnglishMst.new
  end

  # GET /english_msts/1/edit
  def edit
  end

  # POST /english_msts
  # POST /english_msts.json
  def create
    @english_mst = EnglishMst.new(english_mst_params)

    respond_to do |format|
      if @english_mst.save
        format.html { redirect_to @english_mst, notice: 'English mst was successfully created.' }
        format.json { render :show, status: :created, location: @english_mst }
      else
        format.html { render :new }
        format.json { render json: @english_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /english_msts/1
  # PATCH/PUT /english_msts/1.json
  def update
    respond_to do |format|
      if @english_mst.update(english_mst_params)
        format.html { redirect_to @english_mst, notice: 'English mst was successfully updated.' }
        format.json { render :show, status: :ok, location: @english_mst }
      else
        format.html { render :edit }
        format.json { render json: @english_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /english_msts/1
  # DELETE /english_msts/1.json
  def destroy
    @english_mst.destroy
    respond_to do |format|
      format.html { redirect_to english_msts_url, notice: 'English mst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_english_mst
      @english_mst = EnglishMst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def english_mst_params
      params.require(:english_mst).permit(:word, :mean, :valid)
    end
end
