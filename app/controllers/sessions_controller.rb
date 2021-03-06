class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash[:warning] = "Try Again"
      redirect_to sessions_new_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to sessions_new_path
  end
end
