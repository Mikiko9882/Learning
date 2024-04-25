class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :subject_name, null: false

      t.timestamps
    end
  end
end
