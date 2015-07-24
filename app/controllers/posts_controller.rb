class PostsController < ApplicationController
  before_action :set_editable_post, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    # 1: del scaffold
    # @posts = Post.all
    #
    # Ejercicio, solo 10 publicados
    # @posts = Post.where(published: true).limit(10)

    # Ejercicio: todos o publicados segun parámetro
    # @posts = Post.limit(10).order('created_at ASC')

    # Ejercicio: usar includes
    # @posts = Post.includes(:comments).limit(10).order('created_at ASC')
    # @posts = @posts.where(published: true) unless params[:all] == '1'

    # Ejercicio: usar scopes
    # @posts = Post.interesting(params[:all] == '1', params[:qty])

    # Ejercicio: usar scopes
    @posts = current_user.visible_posts.interesting(params[:all] == '1', params[:qty])

    # render template: 'app/views/posts/intex.xxx'
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params.merge(user_id: current_user.id))
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # solo puedo verlo si lo cree o es publico
    def set_post
      @post = current_user.visible_posts.find(params[:id])
    end

    # solo puedo editar/borrar si lo he creado yo
    def set_editable_post
      @post = current_user.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :description, :published)
    end

end
