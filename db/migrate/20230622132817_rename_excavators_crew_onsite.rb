class RenameExcavatorsCrewOnsite < ActiveRecord::Migration[7.0]
  def change
    rename_column :excavators, :crew_on_site, :crew_onsite
  end
end
