class HomeController < ApplicationController

	def index
		if user_session == nil
			render :layout => false
		else
			redirect_to user_path(current_user)
		end
	end



end
