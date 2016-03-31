DAYS={'0'=>['sunday','Su'],'1'=>['monday','M'],'2'=>['tuesday','T'],'3'=>['wednesday','W'],'4'=>['thursday','Th'],'5'=>['friday','F'],'6'=>['saturday','Sa'],'7'=>['sunday','Su']}
module RemindersHelper
  def get_day(int)
    int=int.to_s
    return DAYS[int][0]
  end

  def get_day_short(int)
    int=int.to_s
    return DAYS[int][1]
  end

  def get_day_num(day)
    day=day.downcase
    return DAYS.key(day)
  end
end
