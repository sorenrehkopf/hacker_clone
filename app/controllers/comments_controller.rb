class CommentsController < ApplicationController
	def create

    if params.key?(:post_id)
      thing = Post.find_by_id(params[:post_id])
  	elsif params.key?(:comment_id)
  	  thing = Comment.find_by_id(params[:comment_id])
    else
      render plain: "You can't comment on that!!"
      return
    end

    new_comment = thing.comments.create comment_params
    current_user.thoughts << new_comment
    redirect_to posts_(params[:post_id])_path
	end
	def comment_params
    	params.require(:comment).permit(:body)
  	end

end
