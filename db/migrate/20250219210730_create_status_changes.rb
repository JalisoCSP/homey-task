class CreateStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :status_changes do |t|
      t.timestamps

      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
    end
  end
end
