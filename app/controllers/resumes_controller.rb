class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :duplicate_check, only: [:new, :create]
  before_action :set_resume, only: [:edit, :update]

  def new
    @resume = Resume.new
    @resume.card_game_experiences.build
  end

  def edit
    @resume = Resume.find(params[:id])
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
    if @resume.update(resume_params)
      redirect_to edit_resume_path(@resume)
    else
      render :edit
    end
  end

  private
  def set_resume
    @resume = current_user.resume
    redirect_to new_resume_path if @resume.nil?
  end

  def duplicate_check
    redirect_to edit_resume_path(current_user.resumes.id) if current_user.resume?
  end

  def resume_params
    params.require(:resume).permit(
      :profile_image, :first_name, :first_name_kana, :last_name, :last_name_kana,
      :contact_method, :phone_number, :user_id, :phone_number,
      card_game_experiences_attributes: [:id, :card_game_id, :experience_year, :experience_month, :_destroy])
  end
end
