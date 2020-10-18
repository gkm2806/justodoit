class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :shared, default: false
      t.boolean :checked, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
