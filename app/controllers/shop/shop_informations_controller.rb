class Shop::ShopInformationsController < ApplicationController
  include Common
  before_action :authenticate_shop!
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
      redirect_to edit_shop_shop_information_path(@shop_information), notice: t('.successfully_created')
    else
      render :new
    end
    rescue => e
      #アドレス不正の場合に発生する例外をキャッチ
      flash.now[:alert] = t('.illegal_address')
      render :new
  end

  def edit
    @shop_information = current_shop.shop_information
  end

  def update
    if @shop_information.update(shop_information_params)
      redirect_to edit_shop_shop_information_path(@shop_information), notice: t('.successfully_updated')
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
    def shop_information_params
      params.require(:shop_information).permit(
        :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number)
    end
end
