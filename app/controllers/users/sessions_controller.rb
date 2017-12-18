class Users::SessionsController < Devise::SessionsController
  before_action :check_user_confirmation, only: :create

  private

  def check_user_confirmation
    user = User.find_by_email(params[:user][:email])
    redirect_to new_confirmation_path(:user),
      notice: I18n.t('devise.failure.unconfirmed') unless user && user.confirmed?
  end
end
