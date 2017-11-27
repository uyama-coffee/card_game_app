class Shop::ProjectsController < ApplicationController
  before_action :set_shop_project, only: [:show, :edit, :update, :destroy]

  def index
    @shop_projects = Project.all
  end

  def show
  end

  def new
    @shop_project = Project.new
  end

  def edit
  end

  def create
    @shop_project = current_shop.projects.build(shop_project_params)
    respond_to do |format|
      if @shop_project.save
        format.html { redirect_to @shop_project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

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
      @shop_project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_project_params
      params.require(:project).permit(:title, :content, :shop_id, :image, :image_cache, :remove_image)
    end
end