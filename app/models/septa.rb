class Septa
def self.trains
  trains=get_trains
  trains= format_trains(trains)
  check_trains(trains)
end

def self.history(trainNum)
  train=get_history(trainNum)
  format_history(train)
end

private
def self.get_trains
  doc = Pismo::Document.new('http://www.septastats.com/api/current/trains')
  return doc.body
end

def self.get_history(trainNum)
  doc = Pismo::Document.new("http://www.septastats.com/api/current/train/#{trainNum}/history")
  return doc.body
end

def self.check_trains(trains)
  trains.each do |t|
    if Train.where(trainno:t['trainno']).count==0
      Train.create(trainno:t['trainno'],dest:t['dest'],source:t['source'])
    end
  end
end

def self.format_trains(s)
  arr=[]
  s=strip_data(s)
  s.each do |train|
    trainHash={}
    train.split(',').each do |info|
      key=info.partition(':').first.strip
      value=info.partition(':').last.strip
      trainHash[key]=value
    end
    arr.push(trainHash)
  end
  return arr
end

def self.strip_data(s)
  s=s.to_s.tr('\"', '')
  s=s.partition('[').last.strip
  s=s.partition(']').first.strip
  s=  s.split('}, {')
  s[0]=s[0].to_s.tr('{','')
  s[s.length-1]=s[s.length-1].to_s.tr('}','')
  return s
end

def self.format_history(train)
    returnArr=[]
    train=strip_data(train)
    train.each do |t|
      t=t.split(',')
      stop_name=t.first.partition(':').last.strip
      resultHash={}
      resultHash[:stop]=stop_name
      t.shift
      t.each do |lateData|
        first=lateData.partition(':').first
        last=lateData.partition(':').last
        if first.include? 'Yesterday'
          resultHash[Date.today-1.day]=last
          next
        elsif first.scan(/\d+/).first != nil
          daysAgo= lateData.scan(/\d+/).first
          resultHash[Date.today-Integer(daysAgo).day]=last
          next
        else
          next
        end
      end
      returnArr.push(resultHash)
    end
    return returnArr
end

end
