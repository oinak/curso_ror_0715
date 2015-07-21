class CommentsController < ApplicationController

  before_action :set_post

  def index
    # render text: @post.comments.map{|c| c.body }.join(',')
    @comments = @post.comments
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
