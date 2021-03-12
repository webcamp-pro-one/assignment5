class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end
  
  def oder_params
    params.require.(:oder).permit(:customer_id,
                                  :is_active,
                                  :at_create)
  end
  
end
