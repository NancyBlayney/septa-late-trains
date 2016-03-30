class RemindersController < ApplicationController

  def create
    build_schedule
    binding.pry
    current_user.reminders.create(reminder_params)
    redirect_to :back
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
def reminder_params
  params.require(:reminder).permit(:trainno,:alarmtime,:offset,:days)
end
  def build_schedule
  sched_string=''

  if params[:reminder][:monday]=='1'
    sched_string+='1'
  end
  if params[:reminder][:tuesday]=='1'
    sched_string+='2'
  end
  if params[:reminder][:wednesday]=='1'
    sched_string+='3'
  end
  if params[:reminder][:thursday]=='1'
    sched_string+='4'
  end
  if params[:reminder][:friday]=='1'
    sched_string+='5'
  end
  if params[:reminder][:saturday]=='1'
    sched_string+='6'
  end
  if params[:reminder][:sunday]=='1'
    sched_string+='0'
  end
  params[:reminder][:days]=sched_string
  end
end
