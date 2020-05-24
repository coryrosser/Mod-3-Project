class User < ApplicationRecord
    has_many :items 
    has_one :profile 
    has_many :line_items
    has_many :trades

    validates :first_name, :last_name, :email, presence: true, uniqueness: true 
    validates :location, presence: true  
end
