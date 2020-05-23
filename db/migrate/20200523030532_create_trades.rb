class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :trader_id
      t.integer :trader_item_id
      t.integer :tradee_id
      t.integer :tradee_item_id
      t.integer :status

      t.timestamps
    end
  end
end
