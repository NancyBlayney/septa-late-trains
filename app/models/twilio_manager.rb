class TwilioManager
  def self.send_message(rems)
    # rems is an array of {:trainno,:user_phone,:offset}
  rems.each do |r|
    to = r[:user_phone]
    msg="Train # #{r[:trainno]} is currently running #{r[:offset]} minutes late."
    self.send(to,msg)
  end
  end
  private

  def self.send(to,msg)
    @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
    @twilio_client.account.sms.messages.create(
    :from => ENV['TWILIO_PHONE_NUMBER'],
    :to => to,
    :body => msg
    )
    #code
  end
end
