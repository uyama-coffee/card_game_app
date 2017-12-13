class Shop::ShopInformationsController < ApplicationController

  def edit
    @shop_information = current_shop.shop_information
  end

  def update
    @shop_information = current_shop.shop_information
    if @shop_information.update(shop_information_params)
      @flag = false
      @shop_information.save
      redirect_to edit_shop_shop_information_path(@shop_information)
    else
      render :edit
    end
  end

  private

    def shop_information_params
      params.require(:shop_information).permit(
        :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number, :flag)
    end
end
