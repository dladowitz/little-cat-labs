class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.float :amount
      t.integer :cat_id

      t.timestamps
    end
  end
end
