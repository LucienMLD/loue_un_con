class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.all
  end

  def show
  end


  private

  def set_params
    params.require(:user).permit(:first_name, :last_name, :email, :address)
  end

  def set_user
     @user = User.find(params[:id])
  end

end
