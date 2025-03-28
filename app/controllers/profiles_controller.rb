class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profiles_show_path, success: t("defaults.message.updated", item: User.model_name.human)
    else
      flash.now[:danger] = t("defaults.message.not_updated", item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :description, :profile, :profile_cache)
  end
end
