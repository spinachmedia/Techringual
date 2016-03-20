class WordRankInfosController < ApplicationController
  before_action :set_word_rank_info, only: [:show, :edit, :update, :destroy]

  # GET /word_rank_infos
  # GET /word_rank_infos.json
  def index
    @word_rank_infos = WordRankInfo.all.order("count DESC")
  end

  # GET /word_rank_infos/1
  # GET /word_rank_infos/1.json
  def show
  end

  # GET /word_rank_infos/new
  def new
    @word_rank_info = WordRankInfo.new
  end

  # GET /word_rank_infos/1/edit
  def edit
  end

  # POST /word_rank_infos
  # POST /word_rank_infos.json
  def create
    @word_rank_info = WordRankInfo.new(word_rank_info_params)

    respond_to do |format|
      if @word_rank_info.save
        format.html { redirect_to @word_rank_info, notice: 'Word rank info was successfully created.' }
        format.json { render :show, status: :created, location: @word_rank_info }
      else
        format.html { render :new }
        format.json { render json: @word_rank_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_rank_infos/1
  # PATCH/PUT /word_rank_infos/1.json
  def update
    respond_to do |format|
      if @word_rank_info.update(word_rank_info_params)
        format.html { redirect_to @word_rank_info, notice: 'Word rank info was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_rank_info }
      else
        format.html { render :edit }
        format.json { render json: @word_rank_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_rank_infos/1
  # DELETE /word_rank_infos/1.json
  def destroy
    @word_rank_info.destroy
    respond_to do |format|
      format.html { redirect_to word_rank_infos_url, notice: 'Word rank info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_rank_info
      @word_rank_info = WordRankInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_rank_info_params
      params.require(:word_rank_info).permit(:word, :site_id, :count)
    end
end
