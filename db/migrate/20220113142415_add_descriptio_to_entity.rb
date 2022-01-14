class AddDescriptioToEntity < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :description, :text, default: ''
  end
end
