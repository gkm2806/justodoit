class Items::Toggle < BusinessProcess::Base
  needs :item

  steps :update_self,
       :update_parent,
       :update_children,
       :update_itemable,
       :create_message,

  def call
    process_steps
  end

  def update_self
    item.update(checked: !item.checked)
  end

  def update_parent
    item&.parent&.update(checked: item.parent.items.pluck(:checked).reduce(:&))
  end

  def update_children
    item&.items&.update_all(checked: item.checked)
  end

  def update_itemable
    if item.parent.nil?
      item.itemable.update(checked: item.itemable.items.pluck(:checked).reduce(:&))
    end
  end

  def create_message
    marked = item.checked ? 'marcado' : 'desmarcado'
    { message: "O item \"#{item.content}\" foi #{marked}!" }
  end
end
