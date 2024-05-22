class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find_by(id: params[:item_id])
    @history_buyer = HistoryBuyer.new
    #@history_buyer = HistoryBuyer.new
    #binding.pry
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    # @history = History.create(history_params)
    # Buyer.create(buyer_params)
    @history_buyer = HistoryBuyer.new(history_params)
    if @history_buyer.valid?
      pay_item
      @history_buyer.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    # params.permit(:item_id).merge(user_id: current_user.id)
    params.require(:history_buyer).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: history_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  #def history_buyer_params
   # params.require(:history_buyer).permit(:price).merge(token: params[:token])
  #end

  # def buyer_params
  #   params.permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(history_id: @history.id)
  # end

end
