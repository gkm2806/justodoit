class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.where(shared: true).where.not(user: current_user)
  end

  def create
    @list = current_user.lists.new(list_params)

    return render json: @list.errors, status: :unprocessable_entity unless @list.save
    redirect_to @list, notice: 'List was successfully created.' 
  end

  private

  def list_params
    params.require(:list).permit(:name, :checked, :shared, items_attributes: [:content])
  end

  def find_list
    @list = List.includes(items: :items).find(params[:id])
  end
end
