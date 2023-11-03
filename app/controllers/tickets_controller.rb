class TicketsController < ApplicationController
  before_action :set_associations, only: %i[new edit]

  expose :tickets, -> { Ticket.includes(:excavator).order(:sort) }
  expose :ticket, -> { Ticket.find(params[:id]) }
  expose :coordinates, -> { ticket.well_known_text&.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/) }
  expose :excavator, from: :ticket

  def update
    respond_to do |format|
      if ticket.update(ticket_params)
        format.turbo_stream { notice_msg }
        format.html { redirect_to tickets_path }
      else
        error_msg
      end
    end
  end

  def destroy
    respond_to do |format|
      if ticket.delete
        format.turbo_stream { notice_msg }
        format.html { redirect_to tickets_path }
      else
        error_msg
      end
    end
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
