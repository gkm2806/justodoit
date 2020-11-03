class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    @lists = List.where(shared: true).where.not(user: current_user)
  end

  def create
    @list = current_user.lists.new(list_params)

    return render json: @list.errors, status: :unprocessable_entity unless @list.save
    redirect_to @list, notice: 'Lista criada c:'
  end

  def edit
  end

  def show
  end

  def destroy
    if @list.destroy
      flash[:notice] = I18n.t('views.lists.list_deleted')
    end
    redirect_to @list
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Lista Atualizada' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :checked, :shared, items_attributes: [:content])
  end

  def find_list
    @list = List.find(params[:id])
  end

  def check_ownership
    unless current_user == @list.user
      flash[:notice] = I18n.t('views.lists.private_list')
      redirect_to lists_path
    end
  end
end
