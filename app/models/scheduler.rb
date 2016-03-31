class Scheduler
  def self.run
    @train_parser=TrainParser.new
    @rem=Reminder.today_between(Time.now-3.hours,Time.now)
    TwilioManager.send_message(self.match_reminders)
  end

  def self.match_reminders
    reminders_to_send=[]
    @rem.each do |r|
      if @train_parser.late_trains.keys.include? r.trainno.to_s
        lateInfo={
          :trainno =>r.trainno,
          :user_phone =>User.find(r.user_id).mobile_number,
          :offset =>@train_parser.late_trains[r.trainno.to_s]
        }
        if lateInfo[:offset] >= r.offset
          reminders_to_send.push(lateInfo)
        end
      end
    end
    return reminders_to_send
  end

end
