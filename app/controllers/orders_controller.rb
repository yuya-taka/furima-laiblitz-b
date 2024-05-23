class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  before_action :redirect_if_sold_out, only: [:index, :create]
  before_action :set_payjp_public_key, only: [:index, :create]

  def index
    @history_buyer = HistoryBuyer.new
  end

  def create
    @history_buyer = HistoryBuyer.new(history_params)
    if @history_buyer.valid?
      pay_item
      @history_buyer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.require(:history_buyer).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: history_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_out
    
    return unless @item.history.present? || @item.user_id == current_user.id

    redirect_to root_path, alert: 'この商品は購入されました'
  end

  def set_payjp_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  # def history_buyer_params
  # params.require(:history_buyer).permit(:price).merge(token: params[:token])
  # end

  # def buyer_params
  #   params.permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(history_id: @history.id)
  # end
end
