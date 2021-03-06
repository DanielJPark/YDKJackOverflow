helpers do
  def logged_in?
    return true if session[:user_id] != nil
  end

  def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end
end
