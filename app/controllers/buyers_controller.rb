class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    binding.pry
    if @buyer.valid?
      @buyer.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:post_code, :prefecture_id, :city, :street_address, :building).merge(history)
  end

end
