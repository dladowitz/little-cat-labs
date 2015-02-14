class AddScaleIdAndScalePasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :scale_id, :integer
    add_column :users, :scale_password, :string
  end
end
