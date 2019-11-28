class UsersController < ApplicationController
  before_action :set_user

  def index

  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path
    else
      redirect_to edit_user_path
    end
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def set_user
    @user =User.find(params[:id])
  end


end
