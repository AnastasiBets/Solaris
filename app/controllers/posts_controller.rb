class PostsController < ApplicationController

before_action :authenticate_user!
before_action :set_post, only:[:show, :edit, :update, :destroy]
before_action :check_user, only: :edit

  def show
    pp @comment = @post.postcomment
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else 
    render 'new'  
    end 
      
  end

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :photo)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_user
      if current_user.id != @post.user_id and !current_user.admin?
        redirect_to root_path, danger: 'У вас немаэ прав!'
      end
  end

end