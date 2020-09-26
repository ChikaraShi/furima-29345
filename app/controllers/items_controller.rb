class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_show, only: [:edit, :show, :update]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :introduce, :type_id, :condition_id, :ship_fee_id, :ship_from_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_show
    @item = Item.find(params[:id])
  end

end
