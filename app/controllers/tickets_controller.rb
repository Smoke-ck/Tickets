class TicketsController < ApplicationController
  expose :tickets, -> { Ticket.includes(:excavator).order(id: :desc) }
  expose :ticket, -> { Ticket.find(params[:id]) }
  expose :coordinates, -> { ticket.well_known_text.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/) }
end
