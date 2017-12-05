class TopController < ApplicationController
  def index
    #検索オブジェクト
    @search = Project.ransack(params[:q])
    #検索結果をセット
    @projects = @search.result
  end
end
