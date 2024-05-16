class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
