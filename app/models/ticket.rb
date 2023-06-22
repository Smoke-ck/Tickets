class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  has_one :excavation_info, through: :excavator
end
