class AddOrgToPeople < ActiveRecord::Migration[7.0]
  def change
    add_reference :people, :organization, null: false, foreign_key: true
  end
end
