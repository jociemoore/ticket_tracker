class CommentsController < ApplicationController
  before_action :set_ticket, only: [:create, :edit, :update]
  before_action :set_comment, only: [:edit, :update]
  before_action :require_login

  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash["notice"] = "Comment was successfully created."
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end
  end

  def edit
    if current_user != @comment.creator
      flash["error"] = "You can only edit your own comments."
      redirect_to ticket_path(@ticket)
    end
  end

  def update
    if @comment.update(comment_params)
      flash["notice"] = "Comment was successfully updated."
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
