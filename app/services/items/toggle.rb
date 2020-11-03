class Items::Toggle < BaseService
  def initialize(item)
    @item = item
  end

  def call
    update_self
    update_parent
    update_children
    create_message
    share_if_public
    response({ message: @message })
  end

  def update_self
    @item.update(checked: !@item.checked)
  end

  def update_parent
    @item&.parent&.update(checked: @item.parent.items.pluck(:checked).reduce(:&))
  end

  def update_children
    @item&.items&.update_all(checked: @item.checked)
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
