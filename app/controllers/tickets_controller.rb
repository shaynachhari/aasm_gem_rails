class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
    render json: @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.close!
      render json: @ticket
    else
      render json: { error: 'Failed to close ticket' }, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])

    if @ticket.destroy
      head :no_content
    else
      render json: { error: 'Failed to destroy ticket' }, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.permit( :ticket_status)
  end
end
