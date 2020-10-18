class Item < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  has_many :items, as: :itemable
end
