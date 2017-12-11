class TopController < ApplicationController
  def index
    @search = Project.ransack(params[:q])
    @projects = @search.result
  end
end
