class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:post_code, :prefecture_id, :city, :street_address, :building).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_2688513c0dda39e086c8ecfe" 
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
