class Ticket < ApplicationRecord
  include RailsSortable::Model

  set_sortable :sort

  has_one :excavator, dependent: :destroy

  validates_numericality_of :sequence_number, presence: true
  validates :request_type, presence: true

  accepts_nested_attributes_for :excavator, allow_destroy: true

  delegate :company_name, :address, :crew_onsite, to: :excavator, allow_nil: true, prefix: true

  def date_time
    date_times["response_due_date_time"]
  end

  def primary_service_area_code
    service_area["primary_service_area_code"]["sa_code"]
  end

  def additional_service_area_codes
    service_area["additional_service_area_codes"]["sa_code"]
  end
end
