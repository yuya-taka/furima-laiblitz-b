class OrdersController < ApplicationController

  def index
    @item = Item.find_by(id: params[:item_id])
    #@history_buyer = HistoryBuyer.new
    #binding.pry
  end

  def create
    @history = History.new(history_params)
    @history.save
    Buyer.create(buyer_params)
    redirect_to root_path
  end

  private

  def history_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def buyer_params
    params.permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(history_id: @history.id)
  end

end
