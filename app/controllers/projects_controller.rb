class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    #地図情報の作成
    @map = ShopInformation.new.build_map(@project.shop_info)
    #MAP詳細つきのinfowindowを渡す
    @map[0][:infowindow]=render_to_string(partial: "/places/infowindow", locals: { place: @project.shop_info })
    #応募機能 インスタンス作成
    @contact = Contact.new
  end
end
