class User < ApplicationRecord
    has_many :items 
    has_one :profile 
    has_many :line_items
    has_many :trades

    validates :trader_id, :trader_item_id, :tradee_id, :tradee_item_id presence: true
end
