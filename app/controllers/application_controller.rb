class ApplicationController < ActionController::Base

  def authorize_admin
    redirect_to root_path unless current_user.is_admin?
  end

end
