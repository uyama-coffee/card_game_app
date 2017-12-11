class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @project = Project.find(params[:project_id])
    @contact = Contact.new(
      project_id: params[:project_id],
      user_id: current_user.id,
      status:0
    )
    @contact.save
  end

  def destroy
    @contact = Contact.find_by(project_id: params[:project_id], user_id:current_user.id)
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:status, :user_id, :project_id)
    end
end
