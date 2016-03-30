class DayConverter
  DAYS={'0'=>'sunday','1'=>'monday','2'=>'tuesday','3'=>'wednesday','4'=>'thursday','5'=>'friday','6'=>'saturday','7'=>'sunday'}
  def self.get_day(int)
    int=int.to_s
    return DAYS[int]
  end

  def self.get_day_num(day)
    day=day.downcase
    return DAYS.key(day)
  end

end
