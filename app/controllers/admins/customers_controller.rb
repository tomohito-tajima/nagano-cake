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
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update
    redirect_to admins_customer_path(@customer)
  end
  
end
