class User::FavoritedListsController < ApplicationController
  def index
    @lists = current_user.favorited_lists.all
  end

  def new
    new_favorite = current_user.user_favorited_lists.create(favorited_list_params)

    flash[:notice] = new_favorite.errors.full_messages unless new_favorite.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @user_favorited_list.destroy
  end

  private

  def find_user_favorited_list
    @user_favorited_list = current_user.user_favorited_lists.find_by(list_id: params[:list_id])
  end

  def favorited_list_params
    params.permit(:list_id)
  end
end
