class ItemsController < ApplicationController
  before_action :find_item, only: [:toggle_checked]
  before_action :find_itemable, only: [:create, :show]

  def create
    Item.create(item_params)
    redirect_to @itemable
  end

  def toggle_checked
    @item.update(checked: !@item.checked)
    @item.parent.update(checked: @item.parent.items.pluck(:checked).reduce(:&)) unless @item.parent.nil?
    @item.itemable.update(checked: @item.itemable.items.pluck(:checked).reduce(:&))
    @item.items.update_all(checked: @item.checked)

    marked = @item.checked ? 'marcado' : 'desmarcado'
    share_if_public
    flash[:notice] = "O item \"#{@item.content}\" foi #{marked}!"

    redirect_to @item.itemable
  end

  private

  def share_if_public
    itemable = @item.itemable
    if itemable.shared
      itemable.user_favorited_lists.each do |user_favorited|
        quote = "#{itemable.user.name} atualizou a lista \"#{itemable.name}\""
        ActionCable.server.broadcast "notifications:#{user_favorited.user.id}", { html: quote }
      end
    end
  end

  def find_itemable
    @itemable = item_params[:itemable_type].classify.constantize.find(item_params[:itemable_id])
  end

  def item_params
    params.require(:item).permit(:itemable_type, :itemable_id, :content, :parent_id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def has_access
    unless @itemable.user == current_user
      flash[:notice] = 'Você não pode alterar essa lista =/'
      redirect_to @itemable
    end
  end
end
