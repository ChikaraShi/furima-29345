class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @items = Items.all
  end

  def create
    Items.create(items_params)
  end

  private
  def items_params
    params.require(:items).permit(:image, :name, :introduce, :type_id, :codition_id, :ship_fee_id, :ship_from_id, :ship_date_id, :price, :user)
  end
end
