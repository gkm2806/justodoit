class User::ListsController < ApplicationController
  def index
    @lists = current_user.lists.all
  end

  def new
    @list = current_user.lists.new
    3.times { @list.items.build }
  end
end
