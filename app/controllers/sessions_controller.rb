class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    if log_in(session_params)
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
