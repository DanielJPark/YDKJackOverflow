helpers do
  def logged_in?
    return true if session[:user_id] != nil
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
