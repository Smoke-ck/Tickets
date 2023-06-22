class Api::TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose :ticket, -> { Ticket.create(ticket_params) }
  expose :excavator, -> { ticket.excavator.build(excavator_params) }

  def create
    if ticket.persisted?
      excavator = Excavator.new(excavator_params)
      ticket.excavator = excavator

      render json: { message: 'Ticket created successfully' }, status: :created
    else
      render json: { error: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sanitized_params
    params.deep_transform_keys(&:underscore)
  end

  def ticket_params
    sanitized_params.permit(:request_number, :sequence_number, :request_type, :request_action, date_times: {},
                                    service_area: {}).merge(well_known_text: well_known_text)
  end

  def excavator_params
    sanitized_params.require(:excavator).permit(:company_name, :address)
  end

  def well_known_text
    sanitized_params.dig(:excavation_info, :digsite_info, :well_known_text)
  end
end
