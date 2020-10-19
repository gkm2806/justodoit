class List < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :items, as: :itemable
  has_many :user_favorited_lists

  accepts_nested_attributes_for :items,
    allow_destroy: true,
    reject_if: :all_blank

  def favorites_count
    user_favorited_lists.count
  end
end
