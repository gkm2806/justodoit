class List < ApplicationRecord
  belongs_to :user
  has_many :items, as: :itemable

  accepts_nested_attributes_for :items,
    allow_destroy: true,
    reject_if: :all_blank
end
