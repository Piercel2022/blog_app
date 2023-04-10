class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #@user_posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
    @recent_post = @user.most_recent_post.order(created_at: :asc)
  end
end
