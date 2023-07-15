# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  key_card        :string
#  last_name       :string
#  password_digest :string
#  status          :integer          default(0)
#  time_zone       :string           default("UTC")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_users_on_key_card         (key_card) UNIQUE
#  index_users_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Signup < User

  has_secure_password

  validates :password, presence: true
  validates :first_name, :last_name, presence: true
  # validates :email, presence: true, email: true

  attr_accessor :invitation
  before_create :set_status
  after_save :generate_authorizations

  def set_status
    status = 'active'
  end

  def generate_authorizations

    # This method relies on the invitation being passed in as a virtual attribute.
    # once we have this invitation we use it to determine if the new user is a dealer or an Fabform staff.

    invitation = Invitation.find_by_key(self.invitation)

    # if invitation.auths.present?
    #   # this is a Fabform staff member
    #   auths = Authorization.find(invitation.auths)
    #   self.authorizations << auths
    # end

    invitation.destroy
  end


end