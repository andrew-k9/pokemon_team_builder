module ApplicationHelper
  def logged_in?(user)
    session.key?(:user_id) && session[:user_id] == user.id
  end
end
