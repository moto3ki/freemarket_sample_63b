class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :get_todolist, if: :user_signed_in?
  before_action :get_notice, if: :user_signed_in?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:nickname]
    devise_parameter_sanitizer.permit :sign_up, keys: [:kanji_last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: [:kanji_first_name]
    devise_parameter_sanitizer.permit :sign_up, keys: [:kana_last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: [:kana_first_name]
    devise_parameter_sanitizer.permit :sign_up, keys: [:birth_day]
    devise_parameter_sanitizer.permit :sign_up, keys: [:tel_no]
  end
  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def get_todolist
    @todolists = current_user.todolists.where(status: 0)
  end

  def get_notice
    @notices = current_user.notices
  end
end