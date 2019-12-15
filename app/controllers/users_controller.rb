class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def index
    @purchasing = current_user.purchases.where(pay_flg: 0).order("created_at DESC").limit(5)
    @purchased  = current_user.purchases.where(pay_flg: 1).order("created_at DESC").limit(5)
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  def logout

  end

  def sell_items
    @items = current_user.items.where(status: 0)
  end

  def selling_items
    @items = current_user.items.where(status: 1)
    render template: 'users/sell_items'
  end

  def sold_items
    @items = current_user.items.where(status: 2)
    render template: 'users/sell_items'
  end
  
  def buying_items
    @purchases = current_user.purchases.where(pay_flg: 0)
    render template: 'users/buy_items'
  end

  def bought_items
    @purchases = current_user.purchases.where(pay_flg: 1)
    render template: 'users/buy_items'
  end

  def show
    @items = @user.items
  end

  def sold_score
    
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
