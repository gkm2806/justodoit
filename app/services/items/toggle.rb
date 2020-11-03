class Items::Toggle < BaseService
  def initialize(item)
    @item = item
  end

  def call
    update_self
    go_down_to_leafs(@item)
    go_up_to_root(@item)
    create_message
    share_if_public
    response({ message: @message })
  end

  def update_self
    @item.update(checked: !@item.checked)
  end

  def go_down_to_leafs(item)
    return if item.nil?
    item.items.each do |child|
      child.update(checked: child.parent.checked)
      go_down_to_leafs(child) if child.items.present?
    end
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

  def create_message
    marked = @item.checked ? 'marcado' : 'desmarcado'
    @message = "O item \"#{@item.content}\" foi #{marked}!"
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
