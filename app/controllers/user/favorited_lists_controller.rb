class User::FavoritedListsController < ApplicationController
  before_action :find_user_favorited_list, only: [:unfavorite]
  def index
    @lists = current_user.favorited_lists.all
  end

  def new
    new_favorite = current_user.user_favorited_lists.create(favorited_list_params)

    flash[:notice] = if new_favorite.save
      I18n.t('views.favorited_lists.favorited')
    else
      new_favorite.errors.full_messages.first
    end
    redirect_back fallback_location: root_path
  end

  def unfavorite
    @user_favorited_list.destroy
    flash[:notice] = I18n.t('views.favorited_lists.unfavorited')
    redirect_to user_favorited_lists_path
  end

  private

  def find_user_favorited_list
    @user_favorited_list = current_user.user_favorited_lists.find_by(list_id: params[:id])
  end

  def favorited_list_params
    params.permit(:list_id)
  end
end
