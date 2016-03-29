class UsersController < ApplicationController
	def show
		@user = current_user
		if @user.is_verified

		else
			flash[:alert] = "PLEASE VERIFY YOUR PHONE NUMBER"	
			redirect_to verify_number_path(@user)
		end
	end

	def verify_number
		@user = current_user
	end

end
