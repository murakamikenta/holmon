class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザが登録されました"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザ設定を更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "ユーザが削除されました"
    redirect_to users_url
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
