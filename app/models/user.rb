class User < ApplicationRecord
    has_many :items 
    has_one :profile 
    has_many :line_items
    has_many :trades
end
