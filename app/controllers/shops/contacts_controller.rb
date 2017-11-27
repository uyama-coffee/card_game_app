class Shops::ContactsController < ApplicationController
  def index
    @contacts = current_shop.contacts
  end

  def show
    @resume = Resume.find(params[:resume_id])
  end
end
