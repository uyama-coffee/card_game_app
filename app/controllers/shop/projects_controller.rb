class Shop::ProjectsController < ApplicationController
  before_action :set_shop_project, only: [:show, :edit, :update, :destroy]

  # GET /shop/projects
  # GET /shop/projects.json
  def index
    @shop_projects = Shop::Project.all
  end

  # GET /shop/projects/1
  # GET /shop/projects/1.json
  def show
  end

  # GET /shop/projects/new
  def new
    @shop_project = Shop::Project.new
  end

  # GET /shop/projects/1/edit
  def edit
  end

  # POST /shop/projects
  # POST /shop/projects.json
  def create
    @shop_project = Shop::Project.new(shop_project_params)

    respond_to do |format|
      if @shop_project.save
        format.html { redirect_to @shop_project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @shop_project }
      else
        format.html { render :new }
        format.json { render json: @shop_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop/projects/1
  # PATCH/PUT /shop/projects/1.json
  def update
    respond_to do |format|
      if @shop_project.update(shop_project_params)
        format.html { redirect_to @shop_project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_project }
      else
        format.html { render :edit }
        format.json { render json: @shop_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop/projects/1
  # DELETE /shop/projects/1.json
  def destroy
    @shop_project.destroy
    respond_to do |format|
      format.html { redirect_to shop_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_project
      @shop_project = Shop::Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_project_params
      params.fetch(:shop_project, {})
    end
end
