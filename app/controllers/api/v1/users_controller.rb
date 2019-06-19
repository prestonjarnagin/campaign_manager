class Api::V1::UsersController < ApplicationController

    def create
      begin
        User.create!(user_params)
        response = {
          "token": "null"
        }
        render json: {}, status: :created
      end  
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)  
    end
end