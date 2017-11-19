class MypagesController < ApplicationController
  before_action :set_mypage, only: [:show, :edit, :update, :destroy]

  # GET /mypages
  # GET /mypages.json
  def index
    @mypages = Mypage.all
  end

  # GET /mypages/1
  # GET /mypages/1.json
  def show
  end

  # GET /mypages/new
  def new
    @mypage = Mypage.new
  end

  # GET /mypages/1/edit
  def edit
  end

  # POST /mypages
  # POST /mypages.json
  def create
    @mypage = Mypage.new(mypage_params)

    respond_to do |format|
      if @mypage.save
        format.html { redirect_to @mypage, notice: 'Mypage was successfully created.' }
        format.json { render :show, status: :created, location: @mypage }
      else
        format.html { render :new }
        format.json { render json: @mypage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mypages/1
  # PATCH/PUT /mypages/1.json
  def update
    respond_to do |format|
      if @mypage.update(mypage_params)
        format.html { redirect_to @mypage, notice: 'Mypage was successfully updated.' }
        format.json { render :show, status: :ok, location: @mypage }
      else
        format.html { render :edit }
        format.json { render json: @mypage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mypages/1
  # DELETE /mypages/1.json
  def destroy
    @mypage.destroy
    respond_to do |format|
      format.html { redirect_to mypages_url, notice: 'Mypage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mypage
      @mypage = Mypage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mypage_params
      params.fetch(:mypage, {})
    end
end
