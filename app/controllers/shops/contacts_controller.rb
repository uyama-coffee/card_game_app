class Shops::ContactsController < ApplicationController
  def index
    @contacts = Contact.where(project_id: current_shop.projects.pluck(:id))
  end
end
