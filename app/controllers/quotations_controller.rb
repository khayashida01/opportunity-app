class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:edit, :update, :show, :destroy]

  def index
  end

  def new
    @quotation = Quotation.new
    render 'edit'
  end
  
  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.quotation_status_id = 1
    if @quotation.save
      flash[:success] = "Quotation has been created successfully"
    end
    render 'edit'
  end

  private
  def set_quotation
    @quotation = Quotation.find(params[:id])
  end
  
  def quotation_params
    params.require(:quotation).permit(:quotation_id, :date_created, :sales, :customer_id, :description, :revision,
                                      :fob_cif_code, :port, :quantity_allowance_code, :quantity_allowance)
  end

end