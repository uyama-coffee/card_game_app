class Shop::ContactsController < ApplicationController
  def index
    @contacts = current_shop.contacts.order(:id).decorate
  end

  def show
    @contact = Contact.find(params[:id])
    @resume = @contact.resume.decorate
    @card_game_experiences = @resume.card_game_experiences.decorate
  end

  def update
    @contact = Contact.find(params[:contact][:contact_id])
    if current_shop.id == @contact.project.shop_id
      @contact.update(contact_params)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:status)
  end
end
