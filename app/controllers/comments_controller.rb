class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def new
  end
def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to request.referrer
    else
      flash[:danger] = "Comment Fail!"
      render 'blog/home'
    end
end
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Update success!"
      redirect_to micropost_path(@comment.micropost_id)
    else
      redirect_to micropost_path(@comment.micropost_id)
    end
  end
  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end
 private

    def comment_params
      params.require(:comment).permit(:cmcontent, :micropost_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
end
end
