class Item < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  has_many :itens, as: :itemable
end
