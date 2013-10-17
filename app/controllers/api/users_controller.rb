class Api::UsersController < Api::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :basic_auth
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: sign_in(@user), status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      render action: 'show', status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :description, :tel, :password, :password_confirmation,
        :remember_token, :access_token, :address, :url, :facebook, :twitter,
        :reputation, :image, :facebook_id, :twitter_id)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
   
  
end
