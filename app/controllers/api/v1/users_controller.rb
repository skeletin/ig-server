class Api::V1::UsersController < ApplicationController
  def initialize
    @user_service = UserService.new
  end

  private
  def user_params
    params.require(:user).permit(
            :email,
            :full_name,
            :username,
            :password,
            :password_confirmation
          )
  end
end
