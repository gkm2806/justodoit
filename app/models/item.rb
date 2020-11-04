class Item < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :parent, optional: true, class_name: 'Item'

  validates :content, presence: true

  def items
    Item.where(itemable: itemable, parent_id: id)
  end
end
