class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all
    else
      redirect_to user_session_path
    end
  end

  def show
    @user = User.find(params[:id])
    #@user_posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
    @recent_post = @user.most_recent_post.order(created_at: :asc)
  end
end
