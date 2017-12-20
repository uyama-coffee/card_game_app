class Shop::ShopInformationsController < ApplicationController
  before_action :duplicate_check, only: [:new, :create]
  before_action :set_shop_information, only: [:edit, :update]

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
    #地図情報の作成
    @map = ShopInformation.new.build_map(@shop_information)
    #MAP詳細つきのinfowindowを渡す
    @map[0][:infowindow]=render_to_string(partial: "shared/infowindow", locals: { place: @shop_information })
    
  end

  def update
    @shop_information = current_shop.shop_information
    if @shop_information.update(shop_information_params)
      @shop_information.save
      redirect_to edit_shop_shop_information_path(@shop_information)
    else
      render :edit
    end
  end

  private
    def set_shop_information
      @shop_information = current_shop.shop_information
      redirect_to new_shop_shop_information_path if @shop_information.nil?
    end

    def duplicate_check
      redirect_to edit_shop_shop_information_path(current_shop.shop_information.id) if current_shop.shop_information
    end
    def shop_information_params
      params.require(:shop_information).permit(
        :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number)
    end
end
