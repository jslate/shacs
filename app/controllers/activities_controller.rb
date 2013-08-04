class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.create(activity_params)
    current_user.following_activities += [activity.id]
    current_user.save
    redirect_to activities_path, notice: 'Activity created'
  end

  def follow
    activity = Activity.find(params[:id])
    current_user.follow(activity)
    render nothing: true
  end

  def unfollow
    activity = Activity.find(params[:id])
    current_user.unfollow(activity)
    render nothing: true
  end

  private

     def activity_params
       params.require(:activity).permit(:name)
     end

end
