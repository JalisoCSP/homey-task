class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.timestamps
      t.string :name, null: false
      t.string :status, default: "draft"
    end
  end
end
