class RemindersController < ApplicationController

  def new
  end

  def create
    build_schedule
    current_user.reminders.create(reminder_params)
    flash[:notice] = "New reminder successfully added."
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
      flash[:notice] = "  Successfully updated your reminder."
      redirect_to :back
    else
      flash[:alert] = '  There was an error updating your reminder.'
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    if @reminder.destroy
      flash[:notice] = '  Your reminder was successfully deleted.'
      redirect_to :back
    else
      flash[:alert] = '  There was a problem deleting your reminder.'
    end
  end

  private

def reminder_params
  params.require(:reminder).permit(:trainno,:alarmtime,:offset,:days)
end


end
