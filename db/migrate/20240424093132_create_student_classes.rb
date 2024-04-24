class CreateStudentClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_classes do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
