class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :itemable_id
      t.string :itemable_type
      t.string :content
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
