class ChangeStudentsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :email
    add_column :students, :student_number, :string
    add_index :students, :student_number, unique: true
  end
end
