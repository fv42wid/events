class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def new
    @event = Event.new
  end

  def create
    @event = current_user.build(event_params)
  end

  def show
  end

  def index
  end

  private
    def event_params
      params.require(:event).permit(:name, :location)
    end
end
