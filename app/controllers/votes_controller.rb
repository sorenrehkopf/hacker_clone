class VotesController < ApplicationController

	before_action :is_authenticated?

	def create 
		if params.key?(:post_id)
		thing = Post.find_by_id(params[:post_id])
		elsif params.key?(:user_id)
		thing = User.find_by_id(params[:user_id])
		elsif params.key?(:comment_id)
		thing = Comment.find_by_id(params[:comment_id])
		else
		render plain: "You can't vote on that!!"
		return
		end

		my_vote = thing.votes.find_by_user_id(current_user.id)
		vote_value = params[:button] == 'up' ? 1 :-1
		if my_vote.nil?
		new_vote = thing.votes.create value: vote_value
		current_user.ratings << new_vote
		else
		my_vote.value = vote_value
		my_vote.save
		end
		redirect_to root_path
	end

end
