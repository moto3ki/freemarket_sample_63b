class UsersController < ApplicationController

  def index

  end

  def edit
    @user = find_user_by_id
  end

  def update
    @user = find_user_by_id
    @user.update(user_params)
      if @user.save
        redirect_to edit_user_path
      else
        redirect_to edit_user_path
      end
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def find_user_by_id
    User.find(params[:id])
  end


end
