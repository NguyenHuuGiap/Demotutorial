class BlogController < ApplicationController
  def home
    @post = Micropost.all
    @posts = Micropost.paginate(page: params[:page], per_page: 10)
  	if logged_in?
    @micropost1  = current_user.microposts.build
    @comment = current_user.comments.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
end
