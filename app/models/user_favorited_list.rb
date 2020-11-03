class UserFavoritedList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :user,
  uniqueness: { scope: [:list],
                message: I18n.t('active_record.errors.models.user_favorited_list.attributes.list.uniqueness') }
end
