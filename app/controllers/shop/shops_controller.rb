class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!

  def edit
    @shop = current_shop
    if @shop.shop_name.blank?
      @shop.info = false
    else
      @shop.info = true
    end
  end

  def update
    @shop = current_shop
    if @shop.update(shop_params)
      redirect_to edit_shop_shop_path(@shop), flash: {check: "check!"}
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(
      :shop_name, :address, :phone_number
    )
  end

end
