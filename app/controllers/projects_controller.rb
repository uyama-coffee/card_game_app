class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @contact = Contact.new
  end
end
