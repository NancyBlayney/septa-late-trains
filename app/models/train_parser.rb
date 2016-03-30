class TrainParser
attr_accessor :trains
attr_accessor :late_trains

def initialize
  		response = RestClient.get('http://www3.septa.org/hackathon/TrainView')
  		@trains=JSON.parse(response)
  		@late_trains=find_late_trains
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
		lateTrains=[]
		@trains.each do |t|
			if t['late'] >0
				lateTrains.push(t)
			end
		end
		return lateTrains
	end
end
