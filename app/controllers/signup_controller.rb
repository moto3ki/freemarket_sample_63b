class SignupController < ApplicationController
  
  def step1
    @user = User.new 
  end

  def create
    
    birth_day = Date.new(
      params[:user]["birth_day(1i)"].to_i,
      params[:user]["birth_day(2i)"].to_i,
      params[:user]["birth_day(3i)"].to_i)

    @user = User.new(
      nickname: user_params[:nickname], 
      email: user_params[:email],
      password: user_params[:password],
      kanji_last_name:user_params[:kanji_last_name],
      kanji_first_name:user_params[:kanji_first_name],
      kana_last_name:user_params[:kana_last_name],
      kana_first_name:user_params[:kana_first_name],
      birth_day: birth_day
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
      :birth_day
    )
  end
end
