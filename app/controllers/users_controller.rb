class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

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

  def logout

  end

  def selling_items
    @selling_items = current_user.items.where(status: 0)
  end

  def sold_items
    @sold_items = current_user.items.where(status: 1)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
