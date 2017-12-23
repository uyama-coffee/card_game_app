module ShoptopHelper
  def new_or_edit_shop_shop_information_path
    current_shop.shop_information ? edit_shop_shop_information_path(current_shop) : new_shop_shop_information_path
  end
end
