class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    #@item = Item.find(params[:item_id])
    @buyer = Buyer.new
  end

  def new
    @buyer_history = BuyerHistory.new
  end

  def create
    @buyer_history = BuyerHistory.new(buyer_history)
    if @buyer_history.vaild?
      pay_item
      @buyer_history.save(params,current_user.id)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def buyer_history
    params.require(:buyer_history).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  
  end

  def pay_item
    Payjp.api_key = "sk_test_***********"  
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

