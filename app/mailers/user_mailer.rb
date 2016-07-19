class UserMailer < ApplicationMailer

  def request_admin_access(user)
    @user = user
    mail(to: "antoinfive@gmail.com", subject: "Admin Access Request")
  end
end
