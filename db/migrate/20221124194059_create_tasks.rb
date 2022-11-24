class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.boolean :completed, default: false
      t.datetime :deadline
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
