# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def check_resume_exist
    redirect_to new_resume_path unless current_user.resume?
  end

  def shops_controller?
    !devise_controller? and request.path =~ /^\/shops/
  end
  helper_method :shops_controller?
end
