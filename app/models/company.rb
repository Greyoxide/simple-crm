class Company < ApplicationRecord

  has_many :contacts
  has_many :people, through: :contacts

  has_many :proposals
  has_many :terms, through: :proposals

  validates(:name, presence: true, uniqueness: true)

end