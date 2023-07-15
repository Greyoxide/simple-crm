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
class User < ApplicationRecord

  include OrganizationOwnable

  has_secure_token :key_card

  has_secure_password

  enum status: { inactive: 0, active: 1 }
end