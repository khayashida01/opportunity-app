class WelcomeController < ApplicationController
  before_action :get_all_customers, only: [:index, :today_activities, :this_week_activities, :this_month_activities,
                                          :today_activities_for_manager, :this_week_activities_for_manager, :this_month_activities_for_manager]
  respond_to :html, :js

  def index
    #@users = Geouser.all
    #@hash = Gmaps4rails.build_markers(@users) do |user, marker|
    #  marker.lat user.latitude
    #  marker.lng user.longitude
    #  marker.infowindow user.description
    #  marker.json({title: user.title})
    #end
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      if user.current_latitude && user.current_longitude
        marker.lat user.current_latitude
        marker.lng user.current_longitude
        marker.infowindow user.email
        marker.json({title: user.email})
      end
    end
    
    # Today's activities for current_user
    get_today_activities
    @hash2 = Gmaps4rails.build_markers(@activities_for_staff) do |activity, marker|
      if activity.schedule_latitude && activity.schedule_longitude
        marker.lat activity.schedule_latitude
        marker.lng activity.schedule_longitude
        marker.infowindow activity.schedule_place_name
        marker.json({title: activity.description})
      end
    end

    # Today's activities for all users (for manager)
    if current_user.manager?
      get_today_activities_for_manager
      @user_activity_summary = User.joins(:activities)
      .where(activities: {schedule_start_at: Date.today.beginning_of_day..Date.today.end_of_day})
      .group("users.id, users.first_name, users.last_name")
      .select("users.id, users.first_name, users.last_name, count(*) as cnt")
      .order(:id)
    end

    # Open Todos
    # @todos = Todo.where(user_id: current_user.id, todo_status_id: ApplicationHelper::TODO_STATUS_NEW).order(:id)
    @todos = Todo.where(todo_status_id: ApplicationHelper::TODO_STATUS_NEW).order(due_date: :desc)

    # @hash3 = {}
    # Activity.all do |activity|
    #   if activity.schedule_latitude && activity.schedule_longitude
    #     @hash3.push({lat: activity.schedule_latitude, lng: activity.schedule_longitude})
    #   end
    # end
  end

  def test
  end

  def update_current_location
    @user = current_user
    @user.current_latitude = params[:latitude]
    @user.current_longitude = params[:longitude]
    @user.save
    #render 'welcome/index'
    redirect_to root_path
  end

  # for staff
  def today_activities
    @request_to_path = welcome_today_activities_path
    get_today_activities
    render 'activities_for_staff'
  end

  def this_week_activities
    @request_to_path = welcome_this_week_activities_path
    get_activities_for_staff((Date.today - (Date.today.wday - 1)).beginning_of_day, ((Date.today - (Date.today.wday - 1)) + 6).end_of_day)
    render 'activities_for_staff'
  end

  def this_month_activities
    @request_to_path = welcome_this_month_activities_path
    get_activities_for_staff(Date.today.beginning_of_month.beginning_of_day, Date.today.end_of_month.end_of_day)
    render 'activities_for_staff'
  end

  # for manager
  def today_activities_for_manager
    @request_to_path = welcome_today_activities_for_manager_path
    get_today_activities_for_manager
    render 'activities_for_manager'
  end

  def this_week_activities_for_manager
    @request_to_path = welcome_this_week_activities_for_manager_path
    get_activities_for_manager((Date.today - (Date.today.wday - 1)).beginning_of_day, ((Date.today - (Date.today.wday - 1)) + 6).end_of_day)
    render 'activities_for_manager'
  end

  def this_month_activities_for_manager
    @request_to_path = welcome_this_month_activities_for_manager_path
    get_activities_for_manager(Date.today.beginning_of_month.beginning_of_day, Date.today.end_of_month.end_of_day)
    render 'activities_for_manager'
  end

  private
    def get_activities_for_staff(date_begin, date_end)
      @activities_for_staff = Activity.where(user_id: current_user.id, schedule_start_at: date_begin..date_end).order(:schedule_start_at)
      @today_acticities_center_latitude = (@activities_for_staff.maximum(:schedule_latitude).to_f + @activities_for_staff.minimum(:schedule_latitude).to_f) / 2.0
      @today_acticities_center_longitude = (@activities_for_staff.maximum(:schedule_longitude).to_f + @activities_for_staff.minimum(:schedule_longitude).to_f) / 2.0
    end

    def get_today_activities
      get_activities_for_staff(Date.today.beginning_of_day, Date.today.end_of_day)
    end
    
    def get_activities_for_manager(date_begin, date_end)
      @activities_for_manager = Activity.where(schedule_start_at: date_begin..date_end).order(:schedule_start_at)
      @today_acticities_for_manager_center_latitude = (@activities_for_manager.maximum(:schedule_latitude).to_f + @activities_for_manager.minimum(:schedule_latitude).to_f) / 2.0
      @today_acticities_for_manager_center_longitude = (@activities_for_manager.maximum(:schedule_longitude).to_f + @activities_for_manager.minimum(:schedule_longitude).to_f) / 2.0
    end

    def get_today_activities_for_manager
      get_activities_for_manager(Date.today.beginning_of_day, Date.today.end_of_day)
    end

    def get_all_customers
      # All customers
      if params[:include_all_customers].blank?
        @include_all_customers = session[:include_all_customers]
      else
        @include_all_customers = params[:include_all_customers]
      end
      
      if @include_all_customers == "true" || @include_all_customers == true
        @all_customers = Customer.all
        session[:include_all_customers] = true
      else
        session[:include_all_customers] = false
      end
    end
end