class Excavator < ApplicationRecord
  belongs_to :ticket
  has_one :excavation_info, dependent: :destroy
end
