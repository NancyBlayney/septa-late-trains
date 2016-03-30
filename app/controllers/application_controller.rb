class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	private

	def load_times
		start_time =  4.hours
 		end_time =  24.hours+(start_time-1)
 		increment =  10.minutes
 		Array.new(1 + (end_time - start_time)/increment) do |i|
	 		(Time.now.midnight + (i*increment) + start_time).strftime("%I:%M %p")
 		end
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

  def unpack_schedule(rem)
  	if rem[:days].include?'1'
  		rem.monday='1'
    end
  	if rem[:days].include?'2'
  		rem.tuesday='1'
    end
    if rem[:days].include? '3'
  		rem.wednesday='1'
    end
    if rem[:days].include? '4'
  		rem.thursday='1'
    end
    if rem[:days].include? '5'
  		rem.friday='1'
    end
    if rem[:days].include? '6'
  		rem.saturday='1'
    end
    if rem[:days].include? '0'
  		rem.sunday='1'
    end
  end





end
