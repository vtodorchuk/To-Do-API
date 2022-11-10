class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :completed
      t.date :deadline

      t.timestamps
    end
  end
end
