class SendAddressController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @send_address = @user.send_address
    unless  @send_address
      @send_address = SendAddress.new
    end
  end

  def create
    if  @address = SendAddress.find_by(user_id: current_user.id)
      @send_address = SendAddress.new(send_address_params)
      unless @send_address.valid?
        render action: :new  and return 
      end
      @send_address  = @address.update(send_address_params)
    else
      @send_address = SendAddress.new(send_address_params)
      unless @send_address.valid?
        render action: :new  and return 
      end
      SendAddress.create(send_address_params)
    end
    redirect_to new_user_send_address_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def send_address_params
    params.require(:send_address).permit(
      :kanji_last_name,
      :kanji_first_name, 
      :kana_last_name, 
      :kana_first_name,  
      :post_code, 
      :prefecture_id,      
      :city,     
      :address,          
      :building_name,
      :tel_no
    ).merge(user_id: current_user.id)
  end

end




