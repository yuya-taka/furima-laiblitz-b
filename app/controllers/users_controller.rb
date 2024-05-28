class UsersController < ApplicationController

  def new
    @item = Item.new
  end

  def show
    @nickname = current_user.nickname
    @items = current_user.items
    @user = User.find(params[:id])
  end

end
