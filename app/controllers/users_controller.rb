class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # TODO Add more logic here to tell the user what went wrong if
    # information wasn't saved successfully
    user = User.create(user_params)
    if user.save
      redirect_to dashboard_path
    else
      # From the Rails Docs:
      # Using render with :action is a frequent source of confusion for Rails newcomers.
      # The specified action is used to determine which view to render, but Rails does not run any of the code for that action in the controller.
      # Any instance variables that you require in the view must be set up in the current action before calling render.
      @user = User.new
      flash[:error] = "Error"
      render :new
    end
  end
  private

  def user_params
    params
      .require(:user)
      .permit(
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation)
  end

end
