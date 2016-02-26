class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			@event.attendees << current_user
			flash[:success] = "Event created!"
			redirect_to user_path(current_user)
		else
			render 'new'
		end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
  	@upcoming_events = Event.upcoming
  	@past_events = Event.past
  end

  private

  	def event_params
  		params.require(:event).permit(:title, :date, :description)
  	end
end
