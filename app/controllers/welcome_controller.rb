class WelcomeController < ApplicationController
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
    
    @today_activities = Activity.order(:schedule_datetime)
    @hash2 = Gmaps4rails.build_markers(@today_activities) do |activity, marker|
      if activity.schedule_latitude && activity.schedule_longitude
        marker.lat activity.schedule_latitude
        marker.lng activity.schedule_longitude
        marker.infowindow activity.schedule_place_name
        marker.json({title: activity.description})
      end
    end
    
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
end