class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.integer :user_id
      t.integer :token

      t.timestamps
    end
  end
end
