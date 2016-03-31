class HomeController < ApplicationController

	def index
		if user_session == nil
		else
			redirect_to user_path(current_user)
		end
	end



end
