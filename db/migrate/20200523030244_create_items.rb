class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.integer :condition
      t.integer :retail_value
      t.string :finish
      t.integer :trade_rating
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
