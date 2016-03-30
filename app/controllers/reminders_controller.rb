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
    unpack_schedule(@reminder)
    @times=load_times
    @offsets=[1,5,10]


    respond_to do |format|
      format.js
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    build_schedule
    if @reminder.update(reminder_params)
      flash[:notice] = "Successfully updated"
      redirect_to :back
    else
      flash[:notice] = 'error'
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    if @reminder.destroy
      redirect_to :back
    else
    end
  end

  private

def reminder_params
  params.require(:reminder).permit(:trainno,:alarmtime,:offset,:days)
end


end
