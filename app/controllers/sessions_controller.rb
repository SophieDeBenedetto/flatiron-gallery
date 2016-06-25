class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_from_auth(auth_hash)
    if user
      log_in(user)
      redirect_to projects_path
    else
      redirect_to projects_path, notice: "Google Auth Failed, please try again"
    end
  end

  def destroy
    user = User.find(session[:user_id])
    log_out(user)
    redirect_to projects_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
