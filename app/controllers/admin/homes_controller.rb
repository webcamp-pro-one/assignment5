class Admin::HomesController < ApplicationController
  
  def top
    @customer = Customer.all
  end
  
  def about
  end
  
end
