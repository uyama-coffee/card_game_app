class ProjectsController < ApplicationController
  include Common
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    set_map(@project.shop_info)
    #応募機能 インスタンス作成
    @contact = Contact.new
  end
end
