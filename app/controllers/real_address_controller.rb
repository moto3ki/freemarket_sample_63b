class RealAddressController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_categories, only: [:new, :create]

  def new
    @realaddress = @user.real_address
    unless @realaddress
      @realaddress = RealAddress.new
    end
  end

  # createアクションの中で、updateとcreateに別れるようにif文を記述。
  # updateとcreateそれぞれで、うまくいかない場合にnewに飛ぶようにif文を記述。
  def create
    @realaddress = @user.real_address
    if @realaddress
      if @realaddress.update(real_address_params)
        redirect_to new_user_real_address_path(current_user)
      else
        render :new
      end
    else
      if RealAddress.create(real_address_params)
        redirect_to new_user_real_address_path(current_user)
      else
        render :new
      end
    end
  end
  

  private

  def real_address_params
    params.require(:real_address).permit(:post_code, :prefectures, :city, :address, :building_name).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
