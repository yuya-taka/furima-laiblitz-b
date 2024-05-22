class OrdersController < ApplicationController

  def index
    @item = Item.find_by(id: params[:item_id])
    @history_buyer = HistoryBuyer.new
    #@history_buyer = HistoryBuyer.new
    #binding.pry
  end

  def create
    
    # @history = History.create(history_params)
    # Buyer.create(buyer_params)
    @history_buyer = HistoryBuyer.new(history_params)
    binding.pry
    if @history_buyer.valid?
      @history_buyer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    # params.permit(:item_id).merge(user_id: current_user.id)
    params.require(:history_buyer).permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def buyer_params
  #   params.permit(:post_code, :prefecture_id, :city,  :street_address, :building, :phone_number).merge(history_id: @history.id)
  # end

end
