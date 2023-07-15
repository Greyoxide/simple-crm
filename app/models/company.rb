# == Schema Information
#
# Table name: companies
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_companies_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Company < ApplicationRecord
  include OrganizationOwnable

  # belongs_to :organization

  has_many :contacts
  has_many :people, through: :contacts

  has_many :proposals
  has_many :terms, through: :proposals

  validates(:name, presence: true, uniqueness: true)

end
