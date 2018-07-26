class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def index
    @customers = Customer.all.paginate(page: params[:page], per_page: 5)
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
    5.times do
      @customer.staffs.build
    end
    @customer.company_name = params[:company_name]
    @customer.latitude = params[:latitude]
    @customer.longitude = params[:longitude]
    @customer.url = params[:url]
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
    (5 - @customer.staffs.count).times do
      @customer.staffs.build
    end
    set_customer_map
  end
  
  def show
    set_customer_map
  end
  
  def update
    set_customer_map
    if @customer.update(customer_params)
      flash.now[:success] = "Customer has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  def customer_search
  end
  
  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    def customer_params
      params.require(:customer).permit(:company_name, :industry_code, :url, :business_description, :contact_first_name, :contact_last_name,
                                        :contact_title, :contact_department, :contact_tel, :contact_email, :bill_to_street, :bill_to_city,
                                        :bill_to_state, :bill_to_zip_code, :bill_to_country, :ship_to_first_name, :ship_to_last_name,
                                        :ship_to_tel, :ship_to_email, :ship_to_street, :ship_to_city, :ship_to_state, :ship_to_zip_code,
                                        :ship_to_country, :latitude, :longitude,
                                        staffs_attributes: [:id, :first_name, :last_name, :title, :department, :tel, :email])
    end

    def set_customer_map
      @hash2 = Gmaps4rails.build_markers(@customer) do |customer, marker|
        if customer.latitude && customer.longitude
          marker.lat customer.latitude
          marker.lng customer.longitude
          marker.infowindow customer.latitude
          marker.json({title: customer.latitude})
        end
      end
    end
end