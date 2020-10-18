class List < ApplicationRecord
  belongs_to :user
  has_many :items, as: :itemable
end
