class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit]
  before_action :redirect_if_not_owner, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :delivery_date_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 別の出品者の商品は見れない機能
  def redirect_if_not_owner
    unless @item.user_id == current_user.id
      redirect_to root_path, alert: "You are not authorized to edit this item."
    end
  end

end
