class CommentsController < ApplicationController

  before_action :set_post

  def index
    # Para probar que de llega a la accion con @post:
    render text: @post.comments.map{|c| c.body }.join(',')

    @comments = @post.comments # para la lista del each
  end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
