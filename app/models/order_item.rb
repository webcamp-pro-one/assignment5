class OrderItem < ApplicationRecord
    
    belongs_to :oder
    belongs_to :item
    
end
