class AddTotalAmountToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :total_amount, :integer
  end
end
