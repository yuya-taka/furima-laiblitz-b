class OrdersController < ApplicationController

  def index
    @item = Item.find_by(id: params[:item_id])
    #@history_buyer = HistoryBuyer.new
    #binding.pry
  end

  def create
    #binding.pry
    History.create(history_params)
    #Buyer.create(buyer_params)
    redirect_to root_path
  end

  private

  def history_params
    params.merge(user: current_user.id, item: params[:item_id])
  end

  def buyer_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  end

end
