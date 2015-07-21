class PostsController < ApplicationController

	# before_action :current_user

	# if !@current_user
	# 	redirect_to root_path
	# end

	def new
		@post = Post.new
	end

	def create
		@current_user.posts.create post_params
		redirect_to root_path
	end

	def post_params
    	params.require(:post).permit(:title,:body)
  	end

end
