class Users::RegistrationsController < Devise::RegistrationsController
  def after_inactive_sign_up_path_for(resource)
    new_user_confirmation_path
  end
end
