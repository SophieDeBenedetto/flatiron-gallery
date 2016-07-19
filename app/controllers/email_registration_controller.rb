class EmailRegistrationController < ApplicationController

  def request_admin
    current_user.set_confirmation_token
    UserMailer.request_admin_access(current_user).deliver_now
    redirect_to projects_path
  end

  def confirm_admin
    binding.pry
    find_from_token
    @user.admin = true
    @user.save(validate: false)
  end

  private

  def find_from_token
    @user = User.find_by(confirm_token: params["token"])
  end
end
