class Items::Toggle < BaseService
  def initialize(item)
    @item = item
  end

  def call
    update_self
    update_parent
    update_children
    create_message
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
end
