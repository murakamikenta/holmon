class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :edit, :create, :update]
    
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
      
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to user_post_url(@comment.post.user, @comment.post)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = "コメントを更新しました"
      redirect_to user_post_url(@comment.post.user, @comment.post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = @comment.post
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_to user_post_url(@post.user, @post)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :title, :body, :unread)
    end
  
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end
end
