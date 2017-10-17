class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(user_id: current_user).order('created_at DESC')

    @comments = ""
    @posts.each do |post|
      @comments << post.content
    end

  end
  
  def show
    # see before_action
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    # see before_action
  end

  def update
    # see before_action

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # see before_action

    @post.destroy
      redirect_to Post
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
