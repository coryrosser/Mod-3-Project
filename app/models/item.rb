class Item < ApplicationRecord
  belongs_to :user
  has_one :line_item

  

  def calculate_trade_rating 
    (self.retail_value * (self.condition/5.to_f)) * 20

    
  #takes an items retail value (1-5) and condition (1-5) 
  #condition is then divided by the max possible score of 5 
  # eg. poor-condition "1/5" would evaluate to .2
  #retail value is multiplied by that decimal to get base value
  #then multiplied by 20 to fit 1-100 scale
  end


end
