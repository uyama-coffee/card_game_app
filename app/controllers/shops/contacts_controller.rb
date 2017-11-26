class Shops::ContactsController < ApplicationController
  def index
    @contacts= current_shop.contacts
  end
end
