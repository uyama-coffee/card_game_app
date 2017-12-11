class ContactsController < ApplicationController
  before_action :authenticate_user!, :check_resume_exist

  def create
    current_user.contacts.create(project_id: params[:project_id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
  end
end
