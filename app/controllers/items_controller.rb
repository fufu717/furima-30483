class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit] 
  def index
    @items = Item.order("id DESC")
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

  def show

  end

  def edit
    
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :postage_id, :category_id, :prefecture_id, :shipping_days_id, :condition_id, :postage_id, :price, :description, :image).merge(user_id: current_user.id)
  end

  def move_to_index
      unless @item.user == current_user
      redirect_to action: :index
    end
  end
end