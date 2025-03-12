class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :user_signed_in?, :current_user
  before_action :set_active_storage_url_options
  before_action :set_user

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end

  def set_user
    @user = current_user
  end
end
