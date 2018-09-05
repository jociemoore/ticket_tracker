class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash["notice"] = "Ticket was successfully created."
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit; end

  def update
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
