class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:user_id, :title, :body, :quantity, :unit, :price,
        :amount, :place, :category, :category_id, :remarks, :image, :url)
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
end
