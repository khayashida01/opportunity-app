class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:edit, :update, :show, :destroy]

  def index
  end
  
  def search
    @quotation_search_text = params[:quotation_search_text]
    @quotations = nil
    if @quotation_search_text.blank?
      #flash.now[:danger] = "Please enter search string"
      #@employees = Employee.search(params[:employee_search_text])
      @quotations = Quotation.where("description LIKE ?", "%#{@quotation_search_text}%").paginate(page: params[:page], per_page: 5)
    else
      @quotations = Quotation.where("description LIKE ?", "%#{@quotation_search_text}%").paginate(page: params[:page], per_page: 5)
      if @quotations.empty?
        @quotations = nil
        flash.now[:danger] = "No quotation found"
      end
    end
    render 'quotations/index'
  end
  
  def show
    render 'edit'
  end

  def new
    @quotation = Quotation.new
    render 'edit'
  end
  
  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.quotation_status_id = 0
    if @quotation.save
      flash[:success] = "Quotation has been created successfully"
    end
    render 'edit'
  end
  
  def update
    if params[:submit]
      @quotation.quotation_status_id = 1
    end
    
    if @quotation.update(quotation_params)
      flash.now[:success] = "Quotation has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end

  private
  def set_quotation
    @quotation = Quotation.find(params[:id])
  end
  
  def quotation_params
    params.require(:quotation).permit(:quotation_id, :date_created, :sales, :customer_id, :description, :revision,
                                      :fob_cif_code, :port, :quantity_allowance_code, :quantity_allowance,
                                      :frequency_of_shipment,
                                      :commit)
  end

end