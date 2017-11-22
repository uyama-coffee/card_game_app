class Shops::TopController < Devise::SessionsController
  def index
    @shop = Shop.new
  end
end
