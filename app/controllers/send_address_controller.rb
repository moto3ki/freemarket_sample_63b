class SendAddressController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @send_address = @user.send_address
    unless  @send_address
      @send_address = SendAddress.new
    else 
      @send_address.valid?
    end
  end

  def create
    @send_address = @user.send_address
    begin
      if @send_address.present?
        @send_address = SendAddress.new(send_address_params)
        @send_address.valid?
        @send_address  = SendAddress.update(send_address_params)
       
      else
        @send_address = SendAddress.new(send_address_params)
        @send_address.valid?
        SendAddress.create(send_address_params)
      end
      redirect_to action: "new"
    rescue
      render new
    end
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




