class RemindersController < ApplicationController

  def new
  end

  def create
    build_schedule
    current_user.reminders.create(reminder_params)
    redirect_to :back
  end

  def show
  end

  def edit
    @reminder = Reminder.find(params[:id])
    @times=load_times
    @offsets=[1,5,10]
    
    respond_to do |format|
      format.js
    end
  end

    def load_times
      start_time =  4.hours
      end_time =  24.hours+(start_time-1)
      increment =  10.minutes
      Array.new(1 + (end_time - start_time)/increment) do |i|
        (Time.now.midnight + (i*increment) + start_time).strftime("%I:%M %p")
      end
    end

  def update
    @reminder = Reminder.find(params[:id])
  end

  def destroy
  end

  private

  def reminder_params
    params.require(:reminder).permit(:trainno,:alarmtime,:offset,:days)
  end


end
