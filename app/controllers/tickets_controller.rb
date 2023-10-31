class TicketsController < ApplicationController
  before_action :set_associations, only: %i[new edit]

  expose :tickets, -> { Ticket.includes(:excavator).order(id: :desc) }
  expose :ticket, -> { Ticket.find(params[:id]) }
  expose :coordinates, -> { ticket.well_known_text.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/) }
  expose :excavator, from: :ticket

  def update
    ticket.update(ticket_params) ? notice_msg : error_msg
  end

  def destroy
    ticket.destroy ? notice_msg : error_msg
  end

  private

  def notice_msg
    flash[:success] = t("messages.#{action_name}", record: 'Ticket')
  end

  def error_msg
    flash.now[:error] = ticket.errors.full_messages.to_sentence.delete("'")
  end

  def ticket_params
    params.require(:ticket).permit(:request_number, :sequence_number, :request_type, :request_action,
                                   excavator_attributes: %i[id company_name address crew_onsite])
  end

  def set_associations
    ticket.build_excavator if excavator.blank?
  end
end
