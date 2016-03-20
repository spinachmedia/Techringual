class SiteMstsController < ApplicationController
  before_action :set_site_mst, only: [:show, :edit, :update, :destroy]

  # GET /site_msts
  # GET /site_msts.json
  def index
    @site_msts = SiteMst.all
  end

  # GET /site_msts/1
  # GET /site_msts/1.json
  def show
  end

  # GET /site_msts/new
  def new
    @site_mst = SiteMst.new
  end

  # GET /site_msts/1/edit
  def edit
  end

  # POST /site_msts
  # POST /site_msts.json
  def create
    @site_mst = SiteMst.new(site_mst_params)

    respond_to do |format|
      if @site_mst.save
        format.html { redirect_to @site_mst, notice: 'Site mst was successfully created.' }
        format.json { render :show, status: :created, location: @site_mst }
      else
        format.html { render :new }
        format.json { render json: @site_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_msts/1
  # PATCH/PUT /site_msts/1.json
  def update
    respond_to do |format|
      if @site_mst.update(site_mst_params)
        format.html { redirect_to @site_mst, notice: 'Site mst was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_mst }
      else
        format.html { render :edit }
        format.json { render json: @site_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_msts/1
  # DELETE /site_msts/1.json
  def destroy
    @site_mst.destroy
    respond_to do |format|
      format.html { redirect_to site_msts_url, notice: 'Site mst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_mst
      @site_mst = SiteMst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_mst_params
      params.require(:site_mst).permit(:contents_name, :home_url, :base_url)
    end
end
