module RemindersHelper
  def get_day(int)
    int=int.to_s
    days={'0'=>'sunday','1'=>'monday','2'=>'tuesday','3'=>'wednesday','4'=>'thursday','5'=>'friday','6'=>'saturday','7'=>'sunday'}
    return days[int]
  end

  def get_day_num(day)
    day=day.downcase
    days={'0'=>'sunday','1'=>'monday','2'=>'tuesday','3'=>'wednesday','4'=>'thursday','5'=>'friday','6'=>'saturday','7'=>'sunday'}
    return days.key(day)
  end
end
