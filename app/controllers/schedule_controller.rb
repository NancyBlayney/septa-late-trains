class ScheduleController < ApplicationController
  def index
    @hist=Septa.history(1256)
  end

  def stations
    if params[:train]
      # binding.pry
      @stations=[]
      hist=Septa.history(params[:train])
      hist.each do |h|
        @stations.push(h[:stop])
      end
    end
    render :layout => false
  end

  def lateness_by_station
    if params[:station]  and params[:train]
      hist=Septa.history(params[:train])
      hist.each do |h|
        if params[:station]==h[:stop]
          @train_station_info=h
        end
      end
    end
    render :layout => false
  end
end
