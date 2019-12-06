class SignupController < ApplicationController
  before_action :validates_member_info, only: :tel_no
  before_action :validates_tel_no, only: :address
  before_action :validates_address, only: :create
 
  def member_info
    @user = User.new 
    session["password"] = []
  end

  def tel_no
    @user = User.new 
    
  end

  def address
    
    @send_address = SendAddress.new
    
  end

  def validates_member_info
    #step1で入力した値をsessionに保持
    if params[:user]["birth_day(1i)"].present? && params[:user]["birth_day(2i)"].present? && params[:user]["birth_day(3i)"].present?

      birth_day = Date.new(
        params[:user]["birth_day(1i)"].to_i,
        params[:user]["birth_day(2i)"].to_i,
        params[:user]["birth_day(3i)"].to_i
      )
    end
   
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:kanji_last_name] = user_params[:kanji_last_name]
    session[:kanji_first_name] = user_params[:kanji_first_name]
    session[:kana_last_name] = user_params[:kana_last_name]
    session[:kana_first_name] = user_params[:kana_first_name]
    session[:birth_day] = birth_day

    #バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      kanji_last_name: session[:kanji_last_name],
      kanji_first_name:session[:kanji_first_name],
      kana_last_name:  session[:kana_last_name],
      kana_first_name: session[:kana_first_name],
      birth_day:       session[:birth_day],
      tel_no:          "09012345678"
    )

    # 仮で作成したインスタンスのバリデーションチェックを行う.
    # 仮のインスタンスを作成しないとバリデーションが通らないため
    unless @user.valid?(:member_info_set)
      unless session["devise.sns_id"].present?
        session["password"] = []
      end
      render '/signup/member_info'
    end
  end

  def validates_tel_no
    session[:tel_no] = user_params[:tel_no]
    @user = User.new(
      nickname:        session[:nickname],
      email:           session[:email],
      password:        session[:password],
      kanji_last_name: session[:kanji_last_name],
      kanji_first_name:session[:kanji_first_name],
      kana_last_name:  session[:kana_last_name],
      kana_first_name: session[:kana_first_name],
      birth_day:       session[:birth_day],
      tel_no:          session[:tel_no]
    )
    
    render '/signup/tel_no' unless @user.valid?

    if @user.save 
      session[:id] = @user.id

      if session["devise.sns_id"].present?
         sns = SnsCredential.find(session["devise.sns_id"])
         sns.user_id = @user.id
         sns.save
      end
      
      sign_in User.find(session[:id]) unless user_signed_in?
    end
  end

  def validates_address
    @send_address = SendAddress.new(
      user_id:          current_user.id,
      kanji_last_name:  send_address_params[:kanji_last_name],
      kanji_first_name: send_address_params[:kanji_first_name],
      kana_last_name:   send_address_params[:kana_last_name],
      kana_first_name:  send_address_params[:kana_first_name],
      post_code:        send_address_params[:post_code],
      prefecture_id:    send_address_params[:prefecture_id],
      city:             send_address_params[:city],
      address:          send_address_params[:address],
      building_name:    send_address_params[:building_name],
      tel_no:           send_address_params[:tel_no]
    )

    render '/signup/address' unless @send_address.valid?
  end

  def create
    @send_address = SendAddress.create(
      user_id:          current_user.id,
      kanji_last_name:  send_address_params[:kanji_last_name],
      kanji_first_name: send_address_params[:kanji_first_name],
      kana_last_name:   send_address_params[:kana_last_name],
      kana_first_name:  send_address_params[:kana_first_name],
      post_code:        send_address_params[:post_code],
      prefecture_id:    send_address_params[:prefecture_id],
      city:             send_address_params[:city],
      address:          send_address_params[:address],
      building_name:    send_address_params[:building_name],
      tel_no:           send_address_params[:tel_no]
    )
    
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :kanji_last_name,
      :kanji_first_name,
      :kana_last_name,
      :kana_first_name,
      :birth_day,
      :tel_no
    )
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
    )
  end
end

