class PostsController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user, only: [:new,:create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.Post.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to root_url
    else
      render :new
    end
  end


  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please log in"
      redirect_to signin_url
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
