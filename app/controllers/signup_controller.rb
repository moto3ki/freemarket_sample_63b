class SignupController < ApplicationController
  before_action :validates_member_info, only: :tel_no
  before_action :validates_tel_no, only: :address
 
  def member_info
    @user = User.new 
  end

  def tel_no
    @user = User.new 
    
  end

  def address
    
    @user = User.new
    @user.build_send_address
    #usend_addressモデルと関連付ける。
    
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
    render '/signup/member_info' unless @user.valid?
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
  end

  def create
    
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
    @user.build_send_address(user_params[:send_address_attributes])
    # userにヒモ付けられたsend_addressにuser_paramsにあるsend_address_attributesの値を引数として渡す。

    if @user.save 
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    else
      redirect_to new_user_registration_path
    end
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
      :tel_no,
      send_address_attributes: [:id,
      :kanji_last_name,  
      :kanji_first_name, 
      :kana_last_name, 
      :kana_first_name,  
      :post_code, 
      :prefectures,      
      :city,     
      :address,          
      :building_name,
      :tel_no]
    )
  end
end

