class CommentsController < ApplicationController
  def create
    binding.pry
    @comment = Comment.new(comment_params)
    binding.pry
    if @comment.save
      binding.pry
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
