class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
    def index
      @order = Order.new  
    end
    
    def create  
      @order = Order.new(purchase_params)
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end
    end
  
    private
    def purchase_params
      params.require(:order).permit(:postal_code,:prefecture_id,:city,:address,:building,:phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy')
    end

    def move_to_index
      if @item.purchase.present? || @item.user == current_user
        redirect_to '/items#index/'
      end
    end

end
