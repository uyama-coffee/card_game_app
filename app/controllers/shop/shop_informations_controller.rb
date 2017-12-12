class Shop::ShopInformationsController < ApplicationController
  #before_action :set_shop_information, only: [:edit, :update, :destroy]

  def new
    @shop_information = Shop_information.new
  end

  def edit
    @shop = current_shop
    @shop_information = current_shop.shop_information
  end

  def create
    @shop_information = current_shop.build_shop_information(shop_information_params)
    if @shop_information.save
      redirect_to edit_shop_shop_information_path(@shop_information)
    else
      render :new
    end
  end

  def update
    @shop_information = current_shop.shop_information
    #@shop_information = Shop_information.find(params[:id])
    #binding.pry
    if @shop_information.update(shop_information_params)
      redirect_to edit_shop_shop_information_path(@shop_information)
    else
      render :edit
    end
  end

  private

    def shop_information_params
      params.require(:shop_information).permit(
        :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number)
    end
end
