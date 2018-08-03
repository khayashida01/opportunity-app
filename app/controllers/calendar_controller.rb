class CalendarController < ApplicationController

    def index
        @activities = Activity.all
    end
end
