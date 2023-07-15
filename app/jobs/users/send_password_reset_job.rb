class Users::SendPasswordResetJob < ApplicationJob
  queue_as :default

  def perform(reset_request, user)
    UserMailer.with(reset_request: reset_request, user: user).password_reset.deliver
  end
end
