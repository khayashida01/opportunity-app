class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def index
    @customers = nil
  end
  
  def search
    @customer_search_text = params[:customer_search_text]
    @customers = nil
    if @customer_search_text.blank?
      @customers = Customer.where("company_name LIKE ?", "%#{@customer_search_text}%").paginate(page: params[:page], per_page: 5)
    else
      @customers = Customer.where("company_name LIKE ?", "%#{@customer_search_text}%").paginate(page: params[:page], per_page: 5)
      if @customers.empty?
        @customers = nil
        flash.now[:danger] = "No customer found"
      end
    end
    render 'customers/index'
  end

  def new
    @customer = Customer.new
    render 'edit'
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash.now[:success] = "Customer has been created successfully"
    end
    render 'edit'
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @customer.update(customer_params)
      flash.now[:success] = "Customer has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    def customer_params
      params.require(:customer).permit(:company_name, :industory_code, :url, :business_description, :contact_first_name, :contact_last_name,
                                        :contact_title, :contact_department, :contact_tel, :contact_email, :bill_to_street, :bill_to_city,
                                        :bill_to_state, :bill_to_zip_code, :bill_to_country, :ship_to_first_name, :ship_to_last_name,
                                        :ship_to_tel, :ship_to_email, :ship_to_street, :ship_to_city, :ship_to_state, :ship_to_zip_code,
                                        :ship_to_country)
    end
end