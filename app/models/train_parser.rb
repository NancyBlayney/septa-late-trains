class TrainParser
attr_accessor :trains
attr_accessor :late_trains
attr_accessor :train_numbers
attr_accessor :late_train_numbers

def initialize
  		@trains=JSON.parse(RestClient.get('http://www3.septa.org/hackathon/TrainView'))
  		@late_trains=find_late_trains
      @train_numbers=find_train_numbers
      @late_train_numbers=find_late_train_numbers
end

def find_train(num)
		num=num.to_s
		if trains.count !=0
		    return trains.select {|t| t["trainno"] == num}
		end
end

def is_late?(trainNum)
		trainNum=trainNum.to_s
		if self.trains.count !=0
		train = self.trains.select {|t| t["trainno"] == trainNum}
		if train.count !=0
		if train.first['late']>0
			return true
			else
			return false
		end
		else
			return
		end
		end
end

private
	def find_late_trains
		lateTrains={}
		@trains.each do |t|
			if t['late'] >0
				lateTrains[t['trainno']]=t['late']
			end
		end
		return lateTrains
	end

  def find_train_numbers
    trainNums=[]
    if trains.count !=0
        trains.each do |t|
          trainNums.push(t['trainno'])
        end
    end
    return trainNums
  end

  def find_late_train_numbers
    trainNums=[]
    if trains.count !=0
        trains.each do |t|
          if t['late']>0
            trainNums.push(t['trainno'])
          end
        end
    end
    return trainNums
  end
end
