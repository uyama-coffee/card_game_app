class TopController < ApplicationController
  def index
    @search = Project.ransack(params[:q])
    @projects = @search.result(distinct: true)
    render 'search_result' if params[:q]
  end
end
