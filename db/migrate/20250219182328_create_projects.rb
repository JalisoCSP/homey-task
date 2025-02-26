class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.timestamps
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end
