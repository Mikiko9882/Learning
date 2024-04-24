class AddToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :school, foreign_key: true
    add_reference :students, :grade, foreign_key: true
    add_reference :students, :student_class, foreign_key: true
  end
end
