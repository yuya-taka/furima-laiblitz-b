class HistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @history = History.new
  end

  def new
  end

  def create
    @history = History.new(history_params)
    if @history.vaild?
      @historyform.save(params,current_user.id)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def history_params
    params.require(:history_form).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end

