class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:edit, :update, :show, :destroy]

  def index
  end
  
  def search
    @quotation_search_text = params[:quotation_search_text]
    @quotations = nil
    
    if current_user.employee?
      status = [ApplicationHelper::QUOTATION_STATUS_NEW, ApplicationHelper::QUOTATION_STATUS_SUBMITTED, 
                ApplicationHelper::QUOTATION_STATUS_REVIEWED, ApplicationHelper::QUOTATION_STATUS_REJECTED, ApplicationHelper::QUOTATION_STATUS_APPROVED]
    else
      status = [ApplicationHelper::QUOTATION_STATUS_SUBMITTED, ApplicationHelper::QUOTATION_STATUS_REVIEWED]
    end
    
    if @quotation_search_text.blank?
      #flash.now[:danger] = "Please enter search string"
      #@employees = Employee.search(params[:employee_search_text])
      @quotations = Quotation.where("description LIKE ? AND quotation_status_id IN (?)", "%#{@quotation_search_text}%", status).paginate(page: params[:page], per_page: 5)
    else
      @quotations = Quotation.where("description LIKE ? AND quotation_status_id IN (?)", "%#{@quotation_search_text}%", status).paginate(page: params[:page], per_page: 5)
      if @quotations.empty?
        @quotations = nil
        flash.now[:danger] = "No quotation found"
      end
    end
    render 'quotations/index'
  end
  
  def show
    @quotation.quotation_comments.build()
    render 'edit'
  end

  def new
    @quotation = Quotation.new
    @quotation.quotation_status_id = 0
    render 'edit'
  end
  
  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.save
      flash[:success] = "Quotation has been created successfully"
    end
    render 'edit'
  end
  
  def update
    if params[:quotation_comment]
      if @quotation.update(quotation_params)
        flash.now[:success] = "Quotation has been updated successfully"
        render 'edit'
      else
        render 'edit'
      end
    else
      pm = quotation_params
      if params[:submit]
        pm[:quotation_status_id] = 1
      elsif params[:review]
        pm[:quotation_status_id] = 2
      elsif params[:reject]
        pm[:quotation_status_id] = 3
      elsif params[:approve]
        pm[:quotation_status_id] = 4
      end
      
      if @quotation.update(pm)
        flash.now[:success] = "Quotation has been updated successfully"
        render 'edit'
      else
        render 'edit'
      end
    end
  end

  private
  def set_quotation
    @quotation = Quotation.find(params[:id])
  end
  
  def quotation_params
    params.require(:quotation).permit(:quotation_id, :date_created, :sales, :customer_id, :description, :revision,
                                      :fob_cif_code, :port, :quantity_allowance_code, :quantity_allowance,
                                      :frequency_of_shipment, :quotation_status_id,
                                      :commit,
                                      quotation_comments_attributes: [:id, :comment])
  end

end