module ItemsHelper
  def item_check_box(item)
    mark = item.checked ? 'x' : ' '
    "[#{mark}]"
  end
end
