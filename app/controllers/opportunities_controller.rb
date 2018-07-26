class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:edit, :update, :show, :destroy]

  def index
    @opportunities = Opportunity.all.paginate(page: params[:page], per_page: 5)
  end
  
  def search
    @opportunity_search_text = params[:opportunity_search_text]
    @opportunities = nil
    if @opportunity_search_text.blank?
      #flash.now[:danger] = "Please enter search string"
      #@employees = Employee.search(params[:employee_search_text])
      @opportunities = Opportunity.where("opportunity_name || opportunity_description LIKE ?", "%#{@opportunity_search_text}%").paginate(page: params[:page], per_page: 5)
    else
      @opportunities = Opportunity.where("opportunity_name || opportunity_description LIKE ?", "%#{@opportunity_search_text}%").paginate(page: params[:page], per_page: 5)
      if @opportunities.empty?
        @opportunities = nil
        flash.now[:danger] = "No opportunity found"
      end
    end
    render 'opportunities/index'
  end

  def new
    @opportunity = Opportunity.new
    render 'edit'
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    if @opportunity.save
      flash.now[:success] = "Opportunity has been created successfully"
    end
    render 'edit'
  end
  
  def edit
  end
  
  def show
    render 'edit'
  end
  
  def update
    if @opportunity.update(opportunity_params)
      flash.now[:success] = "Opportunity has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  
  private
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end
    
    def opportunity_params
      params.require(:opportunity).permit(:date_created, :customer_id, :opportunity_name, :opportunity_description, :lead_source_id,
                                          :expected_revenue_amount, :current_expected_revenue_amount, :user_id, :opportunity_stage_id,
                                          :grade_id, :actual_sales_amount)
    end
    
end