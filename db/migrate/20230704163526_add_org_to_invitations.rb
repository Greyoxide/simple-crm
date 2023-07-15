class AddOrgToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_reference :invitations, :organization, null: false, foreign_key: true
  end
end
