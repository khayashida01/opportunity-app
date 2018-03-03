class OpportunitiesController < ApplicationController

  def new
    @opportunity = Opportunity.new
    render 'edit'
  end

end