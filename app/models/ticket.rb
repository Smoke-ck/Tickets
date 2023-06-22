class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  has_one :excavation_info, through: :excavator

  accepts_nested_attributes_for :excavator
end
