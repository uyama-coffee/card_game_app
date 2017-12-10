class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    if @shop.update(shop_params)
      @shop.info = true
      @shop.save
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
