class AddSortToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :sort, :integer
  end
end
