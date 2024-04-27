class ChangeTeachersTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :teachers, :email
    add_column :teachers, :login_id, :string
    add_index :teachers, :login_id, unique: true
  end
end
