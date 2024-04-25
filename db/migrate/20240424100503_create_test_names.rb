class CreateTestNames < ActiveRecord::Migration[7.1]
  def change
    create_table :test_names do |t|
      t.string :test_name, null: false

      t.timestamps
    end
  end
end
