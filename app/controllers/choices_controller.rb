class ChoicesController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path (@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  
  end
  
  private
     def comment_params
      params.require(:choice).permit(:choose_id).merge(user_id: current_user.id, question_id: params[:question_id])
     end
end