class PagesController < ApplicationController
  before_action :set_post
  
  def home
    @posts = Post.default
    @comment = Comment.new
  end

  def devel
    
  end

  def api
  end
  
  private
  
    def set_post
      @post = Post.new
    end
end
