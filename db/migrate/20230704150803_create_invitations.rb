class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.string :key
      t.integer :auths, array: true, defaults: []
      t.string :email

      t.timestamps
    end
    add_index :invitations, :key, unique: true
  end
end