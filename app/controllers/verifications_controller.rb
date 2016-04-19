class VerificationsController < ApplicationController


	def create
	  current_user.verification_code =  1_000_000 + rand(10_000_000 - 1_000_000)
	  current_user.save

	  to = current_user.mobile_number
	  if to[0] != "1"
	    to.insert(0, '1')
	  end

	  @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
	  @twilio_client.account.sms.messages.create(
	    :from => ENV['TWILIO_PHONE_NUMBER'],
	    :to => to,
	    :body => "Your verification code is #{current_user.verification_code}."
	  )

	 	redirect_to :back
		flash[:notice] = "Verification Code Sent."
	end


	def verify
    if current_user.verification_code == params[:verification_code]
      current_user.is_verified = true
      current_user.verification_code = ''
      current_user.save
      redirect_to user_path(current_user), :flash => { :notice => "Thank you for verifying your mobile number." }
      return
    else
      redirect_to verify_number_path, :flash => { :alert => "Invalid verification code." }
      return
    end
	end



end
