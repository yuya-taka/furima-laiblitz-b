class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new, :destroy]
  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

    def destroy
      @item = Item.find(params[:id])
      if current_user.id == @item.user_id
        @item.destroy
        redirect_to root_path
      else
        #
      end
    end

  end

  private


  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :delivery_date_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  # サインインしていないとき、インデックスページしか見れない機能
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
