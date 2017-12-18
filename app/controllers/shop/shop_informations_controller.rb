class Shop::ShopInformationsController < ApplicationController

  def edit
    @shop_information = current_shop.shop_information
  end

  def update
    @shop_information = current_shop.shop_information
    if @shop_information.update(shop_information_params)
      @shop_information.save
      #paramsに緯度が入っていれば、projects#showでの更新
      if shop_information_params.include?('latitude')
        redirect_to project_path(params[:id])
      else
        redirect_to edit_shop_shop_information_path(@shop_information)
      end
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
