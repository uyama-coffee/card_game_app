class Shops::TopController < ApplicationController
  before_action :authenticate_shop

  def index
  end

  private
  #未ログイン時にショップトップ画面（未ログイン）にリダイレクトさせる
  def authenticate_shop
    redirect_to shop_top_index_url unless shop_signed_in?
  end
end
