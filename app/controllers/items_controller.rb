class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: :new
  def index
    
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :delivery_date_id, :prefecture_id, :user)
  end

  # サインインしていないとき、インデックスページしか見れない機能
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
