class UsersController < ApplicationController
	def show
		@user = current_user
		if @user.is_verified

		else
			flash[:alert] = "PLEASE VERIFY YOUR PHONE NUMBER"
			redirect_to verify_number_path(@user)
		end
		@times=load_times
		@offsets=[1,5,10]
	end

	def verify_number
		@user = current_user
	end

	private
	def load_times
		start_time =  4.hours
 		end_time =  24.hours+(start_time-1)
 		increment =  10.minutes
 		Array.new(1 + (end_time - start_time)/increment) do |i|
	 (Time.now.midnight + (i*increment) + start_time).strftime("%I:%M %p")
 end
	end

end
