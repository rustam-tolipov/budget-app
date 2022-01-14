class AddTotalExpensesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :total_expenses, :integer, default: 0
  end
end
