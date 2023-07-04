class Person < ApplicationRecord
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