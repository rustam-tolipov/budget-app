class CreateEntity < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :amount
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
