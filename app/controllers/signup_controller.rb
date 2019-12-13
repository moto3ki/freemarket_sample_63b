class SignupController < ApplicationController
  before_action :validates_member_info, only: :tel_no
  before_action :validates_tel_no, only: :sms_post
  before_action :validates_address, only: :credit

  require "payjp"
 
  def member_info
    @user = User.new 
    session["password"] = []
    session[:tel_no] = []
  end

  def tel_no
    @user = User.new 
  end

  def sms_post
    @user = user_sesssion_set
    #パラメータが飛んでなかった場合ここでrender
    render tel_no_signup_index_path unless  user_params[:tel_no].present?
    #電話番号を+81~の国際書式に書き換え（そうしないと送れない）
    phone_number = user_params[:tel_no].sub(/\A./,'+81')
    #ランダムに5桁の整数を生成
    # sms_number = rand(10000..99999)
    sms_number = 11111
    #後の認証用にsessionに預ける
    session[:sms_number] = sms_number
    #環境変数を使ってsms送信準備 
    # if client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"],ENV["TWILIO_AUTH_TOKEN"])
    #   #送信失敗した場合必ずエラーが出るので、例外処理で挙動を分岐
    #   begin 
    #     #生成した整数を文章にしたsms送信
    #     client.api.account.messages.create(from: ENV["TWILIO_PHONE_NUMBER"], to: phone_number, body: sms_number)
    #   rescue
    #     #失敗した場合ここが動く
    #     redirect_to  tel_no_signup_index_path
    #     return false
    #   end
    # else 
    #   render "signup/tel_no"
    # end
      # 成功した場合、以下のコードが動き、smsの照合画面へと変遷する
    @user.tel_no = nil
    render "/signup/sms_authentication"
  end

  def sms_authentication
    @user = user_sesssion_set
    #送信された値を代入
    sms_number = user_params[:tel_no]
    #比較し、一致したら次の登録フォームへ
    if sms_number.to_i == session[:sms_number]
      if @user.save 
        session[:id] = @user.id
        if session["devise.sns_id"].present?
           sns = SnsCredential.find(session["devise.sns_id"])
           sns.user_id = @user.id
           sns.save
        end
        sign_in User.find(session[:id]) unless user_signed_in?
      end
      redirect_to address_signup_index_path
    else
      @user.tel_no = nil
      render "/signup/sms_authentication"
    end
  end

  def address
    @send_address = SendAddress.new
  end

  def credit
    credit_card = CreditCard.where(user_id: current_user.id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      render '/signup/create'
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        render '/signup/create'
      else
        redirect_to action: "pay"
      end
    end
  end

  def create  
  end

  def validates_member_info
    #step1で入力した値をsessionに保持
    unless session[:tel_no].present?
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
    
    end
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
    @user = user_sesssion_set
    render '/signup/tel_no' unless @user.valid?
  end

  def validates_address
    @send_address = SendAddress.create(send_address_params)
    render '/signup/address' unless @send_address.valid?
  end

  def user_sesssion_set
    User.new( 
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
    ).merge(user_id: current_user.id)
  end

end

