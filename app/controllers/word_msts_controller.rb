class WordMstsController < ApplicationController
  before_action :set_word_mst, only: [:show, :edit, :update, :destroy]

  # GET /word_msts
  # GET /word_msts.json
  def index
    @word_msts = WordMst.all
  end

  # GET /word_msts/1
  # GET /word_msts/1.json
  def show
  end

  # GET /word_msts/new
  def new
    @word_mst = WordMst.new
  end

  # GET /word_msts/1/edit
  def edit
  end

  # POST /word_msts
  # POST /word_msts.json
  def create
    @word_mst = WordMst.new(word_mst_params)

    respond_to do |format|
      if @word_mst.save
        format.html { redirect_to @word_mst, notice: 'Word mst was successfully created.' }
        format.json { render :show, status: :created, location: @word_mst }
      else
        format.html { render :new }
        format.json { render json: @word_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_msts/1
  # PATCH/PUT /word_msts/1.json
  def update
    respond_to do |format|
      if @word_mst.update(word_mst_params)
        format.html { redirect_to @word_mst, notice: 'Word mst was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_mst }
      else
        format.html { render :edit }
        format.json { render json: @word_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_msts/1
  # DELETE /word_msts/1.json
  def destroy
    @word_mst.destroy
    respond_to do |format|
      format.html { redirect_to word_msts_url, notice: 'Word mst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_mst
      @word_mst = WordMst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_mst_params
      params.require(:word_mst).permit(:word, :site_id, :url, :count)
    end
end
