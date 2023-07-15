class AddOrgToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :organization, null: false, foreign_key: true
  end
end
