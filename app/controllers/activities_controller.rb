class ActivitiesController < ApplicationController
  def index
    @volunteer_activities = all_activities 
    @event_activities = all_activities
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end