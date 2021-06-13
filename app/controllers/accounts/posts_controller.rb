module Accounts 
  class PostsController < Accounts::BaseController
    before_action :set_post, only: %i[ show edit update destroy ]
  
    def index
      @posts = current_account.posts.all
    end
  
    def show
    end
  
    def new
      @post = current_account.posts.new
    end
  
    def edit
    end
  
    def create
      @post = current_account.posts.new(post_params)
  
      if @post.save
        redirect_to @post, notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_url, notice: "Post was successfully destroyed."
    end
  
    private
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params
        params.require(:post).permit(:title, :body)
      end
  end
end
