class Reminder < ActiveRecord::Base
belongs_to :user
attr_accessor :monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday

def self.todays_reminders
  rems=[]
  dateNum=DayConverter.get_day_num(Date.today.strftime('%A'))
  Reminder.all.each do |r|
    if r[:days].include? dateNum.to_s
        rems.push(r)
    end
  end
  return rems
end

def self.today_between(start_time,end_time)
  puts start_time
  puts end_time
  start_time=start_time.change(:year => 2000,:month => 01, :day => 01).utc
  end_time=end_time.change(:year => 2000,:month => 01, :day => 01).utc
  puts start_time
  puts end_time
  rems=[]
  dateNum=DayConverter.get_day_num(Date.today.strftime('%A'))
  Reminder.all.where("alarmtime > ? and alarmtime < ?", start_time, end_time.localtime).each do |r|
    if r[:days].include? dateNum.to_s
        rems.push(r)
    end
  end
     return rems
  end

end
