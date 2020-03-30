class CommentsController < ApplicationController
 before_action :authenticate_user!, except: [:create]

 def create
  @mytrip = Mytrip.find(params[:mytrip_id])
  comment = current_user.comments.new(comment_params)
  comment.mytrip_id = @mytrip.id
  comment.save
 end

 def destroy
  @comment = Comment.find(params[:mytrip_id])
  @mytrip = Mytrip.find(@comment.mytrip_id)
	@comment.destroy
 end

private
	def comment_params
	 params.require(:comment).permit(:body)
	end
end
