class UserMailer < ApplicationMailer

  def invite
    @invitation = params[:invitation]
    mail to: @invitation.email, subject: "Welcome to Simple CRM"
  end
  
  def password_reset
    @reset_request = params[:reset_request]
    @user = params[:user]
    mail to: @user.email, subject: "The password reset your requested."
  end
  
end