class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    Activity.create(activity_params)
    redirect_to activities_path, notice: 'Activity created'
  end

  private

     def activity_params
       params.require(:activity).permit(:name)
     end

end
