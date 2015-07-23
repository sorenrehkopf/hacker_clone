class PostsController < ApplicationController

	before_action :is_authenticated?


	def new
		@post = Post.new
	end

	def create
		@current_user.posts.create post_params
		redirect_to root_path
	end
	def destroy
    p= Post.find(params[:id])
    p.delete
    redirect_to root_path
  end

	def show
		@post=Post.find params[:id]
	end

	def post_params
    	params.require(:post).permit(:title,:body)
  	end

end
