class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @item = Item.new
  end

  def create
    @Item.create(items_params)
    if @Item.save
      redirect_to root_pat
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :introduce, :type_id, :codition_id, :ship_fee_id, :ship_from_id, :ship_date_id, :price ).merge(user_id: current_user.id)
  end
end