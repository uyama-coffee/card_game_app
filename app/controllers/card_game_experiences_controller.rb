class CardGameExperiencesController < ApplicationController
  before_action :set_card_game_experience, only: [:show, :edit, :update, :destroy]

  # GET /card_game_experiences
  # GET /card_game_experiences.json
  def index
    @card_game_experiences = CardGameExperience.all
  end

  # GET /card_game_experiences/1
  # GET /card_game_experiences/1.json
  def show
  end

  # GET /card_game_experiences/new
  def new
    @card_game_experience = CardGameExperience.new
  end

  # GET /card_game_experiences/1/edit
  def edit
  end

  # POST /card_game_experiences
  # POST /card_game_experiences.json
  def create
    @card_game_experience = CardGameExperience.new(card_game_experience_params)

    respond_to do |format|
      if @card_game_experience.save
        format.html { redirect_to @card_game_experience, notice: 'Card game experience was successfully created.' }
        format.json { render :show, status: :created, location: @card_game_experience }
      else
        format.html { render :new }
        format.json { render json: @card_game_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_game_experiences/1
  # PATCH/PUT /card_game_experiences/1.json
  def update
    respond_to do |format|
      if @card_game_experience.update(card_game_experience_params)
        format.html { redirect_to @card_game_experience, notice: 'Card game experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_game_experience }
      else
        format.html { render :edit }
        format.json { render json: @card_game_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_game_experiences/1
  # DELETE /card_game_experiences/1.json
  def destroy
    @card_game_experience.destroy
    respond_to do |format|
      format.html { redirect_to card_game_experiences_url, notice: 'Card game experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_game_experience
      @card_game_experience = CardGameExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_game_experience_params
      params.fetch(:card_game_experience, {})
    end
end
