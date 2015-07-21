class CommentsController < ApplicationController

  before_action :set_post

  def index
    # Para probar que de llega a la accion con @post:
    # render text: @post.comments.map{|c| c.body }.join(',')

    @comments = @post.comments # para la lista del each
    @comment  = Comment.new    # para el form de nuevo comentario
  end

  # def new
  # # no lo tenemos, form en el index
  # end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post) , notice: 'Comment created!'
    else
      @comments = @post.comments.select(&:persisted?) # omite @comment con errores
      render :index
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
