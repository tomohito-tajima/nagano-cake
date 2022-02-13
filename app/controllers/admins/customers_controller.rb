class Admins::CustomersController < ApplicationController
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to admins_customer_path(@customer)
  end
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
end
