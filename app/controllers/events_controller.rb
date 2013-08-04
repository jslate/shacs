class EventsController < ApplicationController
  def index
    @events = Event.for_user(current_user).current_and_future
  end

  def new
    @event = Event.new
    @event.set_initial_time
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      if current_user.is_following?(@event.activity)
        redirect_to events_path, notice: 'Event created'
      else
        flash[:warning] = %Q{Your event was created, but you aren't currently following the activity <strong>#{@event.activity.name}</strong>. Go to the <a href="#{activities_path}">activities</a> page to follow it.}.html_safe
        redirect_to events_path
      end
    else
      render 'new'
    end
  end

  private

     def event_params
       params.require(:event).permit(:activity_id, :user_id, :start_time, :location, :notes, :start_date, :start_hour, :start_minute, :start_am_pm)
     end
end
