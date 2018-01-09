class Shop::ShopInformationsController < ApplicationController
  include Common
  #before_action :duplicate_check, only: [:new, :create]
  before_action :create_instance, only: [:new, :create]
  before_action :set_shop_information, only: [:edit, :update]
  before_action -> {
    set_map(@shop_information)
  }

  def new
    @shop_information = ShopInformation.new(shop_id: current_shop.id)
  end

  def create
    @shop_information = current_shop.build_shop_information(shop_information_params)
    if @shop_information.save
      redirect_to edit_shop_shop_information_path(@shop_information), notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    @shop_information = current_shop.shop_information
  end

  def update
    if @shop_information.update(shop_information_params)
      redirect_to edit_shop_shop_information_path(@shop_information), notice: '修正しました'
    else
      render :edit
    end
  end

  private
    def set_shop_information
      @shop_information = current_shop.shop_information
      #カレントのShopInfoが存在しない場合、Newへ飛ばす
      redirect_to new_shop_shop_information_path if @shop_information.nil?
    end

    def create_instance
      #instanceが無い場合に作成する
      @shop_information = ShopInformation.new(shop_id: current_shop.id) if @shop_information.nil?
    end

    #def duplicate_check
      #カレントのShopInfoが存在する場合にEditへ飛ばす
    #  redirect_to edit_shop_shop_information_path(current_shop.shop_information.id) if current_shop.shop_information
    #end

    def shop_information_params
      params.require(:shop_information).permit(
        :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number)
    end
end
