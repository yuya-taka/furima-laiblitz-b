class OrdersController < ApplicationController

  def index
    @item = Item.find_by(id: params[:item_id])
    @order = Order.new
    #@history_buyer = HistoryBuyer.new
    #binding.pry
  end

  def create
    @history = History.new(history_params)
    @history.save
    Buyer.create(buyer_params)
    redirect_to root_path

    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_2688513c0dda39e086c8ecfe"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def buyer_params
    params.permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(history_id: @history.id)
  end

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

end
