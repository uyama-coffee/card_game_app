class Shop::ContactsController < ApplicationController
  def index
    @contacts = current_shop.contacts
  end

  def show
    @contact = Contact.find(params[:id])
    @resume = @contact.resume
  end
end
