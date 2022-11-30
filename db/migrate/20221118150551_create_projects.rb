class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, index: { unique: true, name: 'unique_project_name' }

      t.timestamps
    end
  end
end
