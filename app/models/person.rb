# == Schema Information
#
# Table name: people
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_people_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Person < ApplicationRecord

  include OrganizationOwnable

  validates(:first_name, :last_name, presence: true)
  # validate :name_uniqueness

  has_many :contacts
  has_many :companies, through: :contacts

  def name_uniqueness
    people = Person.all.map{|e| [first_name, last_name].join(' ')}

    people.include?(full_name)

    errors.add(:base, 'Name must be unique.')
  end


  def full_name
    [first_name, last_name].join(" ")
  end
end
