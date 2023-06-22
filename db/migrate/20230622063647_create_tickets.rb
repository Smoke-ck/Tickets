class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.string :request_action
      t.jsonb :date_times
      t.jsonb :service_area

      t.timestamps
    end
  end
end
