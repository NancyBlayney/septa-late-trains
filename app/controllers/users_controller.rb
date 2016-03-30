class UsersController < ApplicationController
	def show
		if user_signed_in?
			@user = current_user
			@reminders = @user.reminders
			if @user.is_verified

			else
				flash[:alert] = "PLEASE VERIFY YOUR PHONE NUMBER"
				redirect_to verify_number_path(@user)
			end
			@times=load_times
			@offsets=[1,5,10]
		else
			redirect_to :root
		end
	end

	def verify_number
		@user = current_user
	end



end
