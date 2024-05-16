class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  # サインインしていないとき、インデックスページしか見れない機能
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
