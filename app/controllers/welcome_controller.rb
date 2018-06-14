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