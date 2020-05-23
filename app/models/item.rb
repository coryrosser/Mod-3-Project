class Item < ApplicationRecord
  belongs_to :user
  has_one :line_item
end
