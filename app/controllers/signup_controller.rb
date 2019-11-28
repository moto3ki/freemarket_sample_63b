class SignupController < ApplicationController
 
  def step1
    @user = User.new 
  end

  def step2
    @user = User.new 
    birth_day = Date.new(
      params[:user]["birth_day(1i)"].to_i,
      params[:user]["birth_day(2i)"].to_i,
      params[:user]["birth_day(3i)"].to_i
    )
   
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:kanji_last_name] = user_params[:kanji_last_name]
    session[:kanji_first_name] = user_params[:kanji_first_name]
    session[:kana_last_name] = user_params[:kana_last_name]
    session[:kana_first_name] = user_params[:kana_first_name]
    session[:birth_day] = birth_day
  end

  def create
    
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      kanji_last_name:session[:kanji_last_name],
      kanji_first_name:session[:kanji_first_name],
      kana_last_name:session[:kana_last_name],
      kana_first_name:session[:kana_first_name],
      birth_day: session[:birth_day],
      tel_no: user_params[:tel_no]
    ) 
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
      :tel_no
    )
  end
end
