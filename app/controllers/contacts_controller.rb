class ContactsController < ApplicationController


  #ログインしないと応募できないし、当然消せない
  #before_action :authenticate_user!, only: [:create, :destroy]


  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
  end

  # GET /contacts/1/edit
  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @contact = Contact.new(
      project_id: params[:project_id],
      #user_id: current_user.id
      #current_userが取れるまでは1で固定
      user_id: 1,
      status:0
    )
    @contact.save
    redirect_to root_path
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    #current_userが取れるまでは1で固定
    @contact = Contact.find_by(project_id: params[:project_id], user_id: 1)
    #binding.pry
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
