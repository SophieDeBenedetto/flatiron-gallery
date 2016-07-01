class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:show]
  def show
    user = User.find(params[:id])
    if current_user == user
      redirect_to profile_path
    end
    @user = UserDecorator.new(User.find(params[:id]))
  end

  def update
    @form_type = params[:form] || "avatar"
    @user = UserDecorator.new(User.find(params[:id]))
    UserUpdaterJob.perform_now(@user, user_params)
    respond_to do |f|
      f.js
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :bio, :github, :twitter, :linkedin, :personal_site, :blog_url, :email, :avatar)
    end
end
