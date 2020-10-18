class ItemsController < ApplicationController
  before_action :find_item, only: [:toggle_checked]

  def toggle_checked
    @item.update(checked: !@item.checked)

    @item.itemable.update(checked: @item.itemable.items.pluck(:checked).reduce(:&))
    @item.items.update_all(checked: @item.checked)

    marked = @item.checked ? 'marcado' : 'desmarcado'

    flash[:notice] = "O item \"#{@item.content}\" foi #{marked}!"
    redirect_back fallback_location: root_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end
end
