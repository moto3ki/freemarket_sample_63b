class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook) #コールバック
  end


  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userが存在しなかったら
      password = []
      session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる(少し難)      
      session["password"] = password_gen(password)
      render "signup/member_info"    #redirect_to だと更新してしまうのでrenderで
    end
  end

  def password_gen(password)
    length = 10
    numbers = [*0..9]
    alpha_bigs = [*'A'..'Z']
    alpha_smalls = [*'a'..'z']
    codes = [numbers, alpha_bigs, alpha_smalls].shuffle
    length.times do |i|
      password << codes[i % codes.length].sample(1)
    end
    password.shuffle.join
  end

  def failure
    redirect_to root_path and return
  end
end
