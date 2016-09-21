module SessionsHelper

  #logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  #return the current logged in user
  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user
        log_in user
        @current_user = User
      end
    end
  end

  #returns true if user is logged in
  def logged_in?
    !current_user.nil?
  end
end
