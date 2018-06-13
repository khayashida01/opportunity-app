class GeousersController < InheritedResources::Base

  private

    def geouser_params
      params.require(:geouser).permit(:title, :description, :address, :latitude, :longitude)
    end
end

