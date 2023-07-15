class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :key_card
      t.string :password_digest
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :users, :key_card, unique: true
  end
end