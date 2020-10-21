class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :postage_id, :category_id, :prefecture_id, :shipping_days_id, :condition_id, :postage_id, :price, :description, :image).merge(user_id: current_user.id)
  end
end
