class Items::Create < BaseService
  def initialize(item_params)
    @item_params = item_params
  end

  def call
    create_new_item
    go_up_to_root(@item)
    share_if_public
  end

  def create_new_item
    @item = Item.create(@item_params)
  end

  def go_up_to_root(item)
    # "But roots are on buttom" Dude I'm not the one making conventions here
    return if item.nil?
    if item&.parent.present?
      item.parent.update(checked: item.parent.items.pluck(:checked).reduce(:&))
    else
      item.itemable.update(checked: item.itemable.items.pluck(:checked).reduce(:&))
    end
    go_up_to_root(item.parent)
  end

  def share_if_public
    itemable = @item.itemable
    if itemable.shared
      itemable.user_favorited_lists.each do |user_favorited|
        quote = "#{itemable.user.name} atualizou a lista \"#{itemable.name}\""
        ActionCable.server.broadcast "notifications:#{user_favorited.user.id}", { html: quote }
      end
    end
  end
end
