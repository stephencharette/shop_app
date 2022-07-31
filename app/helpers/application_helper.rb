module ApplicationHelper
  def current_page_is_auth_path?
    current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path) || current_page?(edit_user_password_path) || current_page?(cancel_user_registration_path) || current_page?(edit_user_registration_path)
  end
end
