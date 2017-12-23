class Shop::ContactsController < ApplicationController
  def index
    @contacts = current_shop.contacts.order(:id)
  end

  def show
    @contact = Contact.find(params[:id])
    @resume = @contact.resume
  end

  def update
    @contact = Contact.find(params[:contact][:contact_id])
    @contact.update(contact_params)
  end

  private
  def contact_params
    params.require(:contact).permit(:status)
  end
end
