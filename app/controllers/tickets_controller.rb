class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @tickets = Ticket.filter_tickets(params)
    @project = params[:project]
    @status = params[:status]
    @tag = params[:tag]
  end

  def show
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user
    @ticket.assignee = User.find(params[:ticket][:assignee])

    if @ticket.save
      flash["notice"] = "Ticket was successfully created."
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit; end

  def update
    @ticket.assignee = User.find(params[:ticket][:assignee])

    if @ticket.update(ticket_params)
      flash["notice"] = "Ticket was successfully updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    if @ticket.destroy
      flash["notice"] = "Ticket was successfully destroyed."
      redirect_to tickets_path
    else
      flash["error"] = "Ticket was not destroyed."
      render :index
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
