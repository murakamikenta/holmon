class PagesController < ApplicationController
  before_action :set_post
  
  def home
    @posts = Post.all
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
