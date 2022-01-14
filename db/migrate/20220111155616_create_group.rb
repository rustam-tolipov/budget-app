class CreateGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.string :color
      t.timestamps
      t.references :user, foreign_key: { to_table: :users }
    end
  end
end
