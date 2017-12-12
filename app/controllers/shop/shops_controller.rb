class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!

  def edit
    @shop = current_shop
    @shop_information = @shop.build_shop_information
  end

  def update
    @shop = current_shop
    if @shop.update(shop_params)
      redirect_to edit_shop_shop_path(@shop)
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop_informations).permit(
     :shop_id, :shop_name, :description, :address, :latitude, :longitude, :phone_number)
  end

end
