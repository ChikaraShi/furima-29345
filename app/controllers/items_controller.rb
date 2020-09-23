class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @items = Items.all
  end
end
