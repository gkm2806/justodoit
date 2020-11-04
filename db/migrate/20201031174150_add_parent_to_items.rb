class AddParentToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :parent_id, :integer
  end
end
