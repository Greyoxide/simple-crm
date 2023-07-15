# == Schema Information
#
# Table name: invitations
#
#  id              :bigint           not null, primary key
#  auths           :integer          is an Array
#  email           :string
#  key             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_invitations_on_key              (key) UNIQUE
#  index_invitations_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Invitation < ApplicationRecord
  has_secure_token :key

  belongs_to :organization

  validates :email, email: true, uniqueness: true
  validate :email_must_be_unique

  before_save :compact_blanks
  after_create :send_invitation

  def email_must_be_unique
    users = User.find_by_email(email)
    errors.add(:email, "A user is already using this email address.") unless users.blank?
  end

  def self.expired
    where('created_at < ?', 24.hours.ago)
  end

  def expired?
    created_at < Time.zone.now - 24.hours
  end

  def send_invitation
    Users::SendInvitationJob.perform_later(self)
  end

  def compact_blanks
    auths.compact_blank! if auths.present?
  end

  def status
    expired? ? 'Expired' : 'Active'
  end
end
