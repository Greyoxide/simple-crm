class Users::SendInvitationJob < ApplicationJob
  queue_as :default

  def perform(invitation)
    UserMailer.with(invitation: invitation).invite.deliver
  end
end
