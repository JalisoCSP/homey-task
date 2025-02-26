class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.timestamps

      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
    end
  end
end
