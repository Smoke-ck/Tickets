class CreateExcavationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :excavation_infos do |t|
      t.jsonb :digsite_info
      t.belongs_to :excavator

      t.timestamps
    end
  end
end
