class ItemsController < ApplicationController
  def index
  end

  def def new
  end
  
  def create
    
  end
  
  def item_params
    params.require(:item).permit(:name,:price,:description,:image).merge(user_id: current_user.id)
  end
end
