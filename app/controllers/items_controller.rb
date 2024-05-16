class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: :new
  def index
    
  end
  
  def new
    @item = Item.new
  end
  
  private

  # サインインしていないとき、インデックスページしか見れない機能
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
