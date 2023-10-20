class TicketsController < ApplicationController
  expose :tickets, -> { Ticket.includes(:excavator).order(id: :desc) }
  expose :ticket, -> { Ticket.find(params[:id]) }
  expose :coordinates, -> { ticket.well_known_text.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/) }


  def update
    ticket.update(ticket_params) ? notice_msg : error_msg
  end

  def destroy
    ticket.destroy ? notice_msg : error_msg
    redirect_to tickets_path
  end

  private

  def notice_msg
    flash[:success] = t("messages.#{action_name}", record: 'Ticket')
  end

  def error_msg
    flash.now[:error] = ticket.errors.full_messages.to_sentence.delete("'")
  end

  def ticket_params
    params.require(:ticket).permit(:request_number, :sequence_number, :request_type, :request_action )
  end
end
