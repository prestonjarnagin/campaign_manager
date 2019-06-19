class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # TODO Add more logic here to tell the user what went wrong if
    # information wasn't saved successfully
    user = User.create(user_params)
    if user.save
      set_current_user(user.id)
      redirect_to dashboard_path
    else
      flash[:error] = "Error"
      redirect_to new_user_path
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
        :password_confirmation
      )
  end
end
