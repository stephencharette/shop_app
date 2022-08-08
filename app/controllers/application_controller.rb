class ApplicationController < ActionController::Base
  def authorize_user_logged_in
    redirect_to root_path unless user_signed_in?
  end

  def authorize_admin
    redirect_to root_path unless current_user.is_admin?
  end
end
