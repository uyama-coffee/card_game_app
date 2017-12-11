class ResumesController < ApplicationController
  before_action :set_resume, only: [:edit, :update, :destroy]
  before_action :set_new, only: [:new, :create]


  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resume = Resume.new
    @resume.card_game_experiences.build
  end

  def edit
    @resume = Resume.find(params[:id])
    #binding.pry
  end

  def create
    @resume = current_user.build_resume(resume_params)
    if @resume.save
      redirect_to edit_resume_path(@resume)
    else
      render :new
    end
  end

  def update
    @resume = Resume.find(params[:id])
    #binding.pry
    if @resume.update(resume_params)
      redirect_to edit_resume_path(@resume), notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def set_new
      redirect_to edit_resume_path(current_user.resume.id) if Resume.exists?(user_id: current_user.id)
    end

    def resume_params
      params.require(:resume).permit(
        :profile_image, :first_name, :first_name_kana, :last_name, :last_name_kana,
        :contact_method, :phone_number, :user_id, :phone_number,
        card_game_experiences_attributes: [:id,:card_game_id, :experience_year, :experience_month, :_destroy])
    end
end
