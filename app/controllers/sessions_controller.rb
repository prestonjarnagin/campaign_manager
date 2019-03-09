class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to dashboard_path
    else
      flash[:error] = "Error" 
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
