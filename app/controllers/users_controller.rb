class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = UserDecorator.new(current_user)
  end

  def create
    binding.pry
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # PrimeUserEmail.new(@user).set_confirmation_token
        # UserMailer.user_invite(@user).deliver_now
       format.js {render "create.js.erb"}
     else
       format.js {render "fail.js.erb"}
      end
    end
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
      params.require(:user).permit(:first_name, :last_name, :bio, :github, :twitter, :linkedin, :personal_site, :blog_url, :email, :avatar, :cohort_id, :conf)
    end
end
