class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
      User.create!(user_params)
      redirect_to dashboard_path
  end
  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
