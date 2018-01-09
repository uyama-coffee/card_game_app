class Shop::ProjectsController < ApplicationController
  before_action :authenticate_shop!
  before_action :set_shop_project, only: [:show, :edit, :update, :destroy]

  def index
    @shop_projects = current_shop.projects
  end

  def show
    #地図情報の作成
    @map = Place.new.build_map(@project.shop_info)
    #応募機能 インスタンス作成
    @contact = Contact.new
  end

  def new
    redirect_to new_shop_shop_information_path, alert: t('.no_shop_information') if current_shop.shop_information.blank?
    @shop_project = Project.new
    @shop_project.handling_card_games.build
  end

  def edit
  end

  def create
    @shop_project = current_shop.projects.build(shop_project_params)
    respond_to do |format|
      if @shop_project.save
        format.html { redirect_to root_path, notice: t('.successfully_created')}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @shop_project.update(shop_project_params)
        format.html { redirect_to shop_projects_path, notice: t('.successfully_updated')}
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @shop_project.destroy
    respond_to do |format|
      format.html { redirect_to shop_projects_url, notice: t('.successfully_updated')}
      format.json { head :no_content }
    end
  end

  private
    def set_shop_project
      @shop_project = Project.find(params[:id])
    end


    def shop_project_params
      params.require(:project)
            .permit(:title, :content, :shop_id, :image, :image_cache, :remove_image,{ :card_game_ids => [] })
    end
end
