class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.where(shared: true)
  end

  private

  def find_list
    @list = List.includes(items: :items).find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :checked, :shared)
  end
end
