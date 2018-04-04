class QuotationCommentsController < ApplicationController
  before_action :set_quotation_comment, only: [:edit, :update, :show, :destroy]

  def create
    @quotation_comment = QuotationComment.new(quotation_comment_params)
    @quotation_comment.user = current_user
    if @quotation_comment.save
      flash.now[:success] = "Comment has been created successfully"
    end
    redirect_to quotation_path(@quotation_comment.quotation_id)
  end
  
  def update
    if @quotation_comment.update(quotation_comment_params)
      flash.now[:success] = "Comment has been updated successfully"
    end
    redirect_to quotation_path(@quotation_comment.quotation_id)
  end
  
  private
  def set_quotation_comment
    @quotation_comment = QuotationComment.find(params[:id])
  end
  
  def quotation_comment_params
    params.require(:quotation_comment).permit(:id, :comment, :quotation_id)
  end
end