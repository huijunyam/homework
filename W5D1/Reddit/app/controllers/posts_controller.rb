class PostsController < ApplicationController
  before_action :require_user, only: [:create, :new]
  before_action :is_author?, only: [:update, :edit]

  def new
    @sub_id = params[:sub_id]
    @subs = Sub.all
    render :new
  end

  def create
    @p = Post.new(post_params)
    @p.author_id = current_user.id
  
    if @p.save
      redirect_to post_url(@p)
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to sub_post_url(@post.sub, @post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def is_author?
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.author_id
      return true
    else
      redirect_to sub_post_url(@post.sub, @post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
