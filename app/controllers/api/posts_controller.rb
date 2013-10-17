class Api::PostsController < Api::ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :close, :image]
  before_action :authenticate_user, only: [:create]
  #before_action :basic_auth, only: [:create]
    
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = User.find(1).posts.build(post_params)
    if @post.save
      render action: 'show', status: :created, location: api_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      render action: 'show', status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post.destroy
    head :no_content
  end
  
  def close
    if @post.closed_at
      @post.update_attribute(:closed_at, nil)
    else
      @post.update_attribute(:closed_at, Time.now)
    end
  end
  
  def image
    send_data(@post.image)
  end
  
  private
    def post_params
      params.require(:post).permit(:user_id, :title, :body, :quantity, :unit, :price,
        :amount, :place, :category, :category_id, :remarks, :image, :image_file, :url)
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
    
    def basic_auth
      authenticate_or_request_with_http_basic do |user, pass|
        logger.info "request.headers: #{request.headers['Authorization']}"
        return if User.find_by(accee_token: user)
        false
      end
    end
end
