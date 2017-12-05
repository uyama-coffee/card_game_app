class ResumesController < ApplicationController
  before_action :set_resume, only: [:edit, :update, :destroy]
  #before_action :set_new, only: [:new, :create]


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
  end

  def create
    @resume = current_user.build_resume(resume_params)
    binding.pry
    if @resume.save
      redirect_to edit_resume_path(@resume)
    else
      render :new
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to edit_resume_path(@resume), notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def set_new
      redirect_to edit_resume_path(current_user.resume) if Resume.exists?(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume)
            .permit(:first_name, :first_name_kana, :last_name, :last_name_kana,:contact_method,:phone_number,
                    :profile_image, :profile_image_cache, :remove_profile_image,{ :card_game_ids => [] })
    end
end
