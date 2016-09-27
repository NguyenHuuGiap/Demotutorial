class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

  
  def show
    @post = Micropost.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page])
  end

  def create
    @micropost1 = current_user.microposts.build(micropost_params)
    if @micropost1.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
   	else
      @feed_items = []
      render 'blog/home'
    end
  end

  def destroy
  	@micropost.destroy
  	flash[:success] = "Success destriy Post"
  	redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
