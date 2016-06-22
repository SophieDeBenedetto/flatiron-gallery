class SessionsController < ApplicationController

  def create
    user = User.find_from_auth(auth_hash)
    if user
      log_in(user)
      redirect_to projects_path
    else
      redirect_to root_path
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
