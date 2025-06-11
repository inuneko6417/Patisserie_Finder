class SessionsController < ApplicationController
  skip_before_action :set_user, only: [ :new, :create ]
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to patisseries_index_path, flash: { notice: t('defaults.login_success') }
    else
      flash.now[:alert] = t('defaults.login_failed')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, alert: t('defaults.logout_success')
  end
end
