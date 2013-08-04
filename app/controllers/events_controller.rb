class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.set_initial_time
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: 'Event created'
    else
      render 'new'
    end
  end

  private

     def event_params
       params.require(:event).permit(:activity_id, :user_id, :start_time, :location, :notes, :start_date, :start_hour, :start_minute, :start_am_pm)
     end
end
