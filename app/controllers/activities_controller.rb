class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update, :show, :destroy]
  
  def index
    @activities = Activity.all.paginate(page: params[:page], per_page: 5)
  end
  
  def search
    @activity_search_text = params[:activity_search_text]
    @activities = nil
    if @activity_search_text.blank?
      #flash.now[:danger] = "Please enter search string"
      #@employees = Employee.search(params[:employee_search_text])
      @activities = Activity.where("description LIKE ?", "%#{@activity_search_text}%").paginate(page: params[:page], per_page: 5)
    else
      @activities = Activity.where("description LIKE ?", "%#{@activity_search_text}%").paginate(page: params[:page], per_page: 5)
      if @activities.empty?
        @activities = nil
        flash.now[:danger] = "No activity found"
      end
    end
    render 'activities/index'
  end
  
  def new
    @activity = Activity.new
    @activity.date_created = Time.zone.now.strftime("%Y-%m-%d")
    render 'edit'
  end
  
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash.now[:success] = "Activity has been created successfully"
    end
    render 'edit'
  end
  
  def edit
  end
  
  def show
    render 'edit'
  end
  
  def update
    if @activity.update(activity_params)
      flash.now[:success] = "Activity has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  def checkin
    activity = Activity.find(params[:activity][:id])
    activity.activity_status_id = 2
    activity.save
  end
  
  def checkout
    activity = Activity.find(params[:activity][:id])
    activity.activity_status_id = 3
    activity.save
  end
  
  private
    def set_activity
      @activity = Activity.find(params[:id])
    end
    
    def activity_params
      params.require(:activity).permit(:opportunity_id, :activity_status_id, :probability, :date_created, :opportunity_stage_code, :log_type,
                                        :due_date, :employee_id, :priority_code, :description, :comment,
                                        :schedule_datetime, :schedule_place_name, :schedule_latitude, :schedule_longitude)
    end
end