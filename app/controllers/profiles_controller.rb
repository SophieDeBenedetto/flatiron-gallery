class ProfilesController < ApplicationController

  def index
  end

  def show
    @user = UserDecorator.new(current_user)
  end
end
