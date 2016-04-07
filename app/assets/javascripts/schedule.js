$(document).ready(function() {
  $('.sched-btn').click(function(e) {
     train = $(e.target).data('train')
     if (Cookies.get(train)) {
       station=Cookies.get(train);
       getScheduleForStation(train,station);
     }else{
       getStationsForTrain(train);
     }
  });
});

function setStation(station) {
  getScheduleForStation(train,station)
}

function getStationsForTrain(train) {
  $.post('/stations', {
    train: train
  }).done(function(data) {
    showScheduleForm()
    $('#schedule-form').html(data)
  }).fail(function() {
    showScheduleForm()
    $('#schedule-form').html("no schedulle available")
  })
}

function getScheduleForStation(train,station) {
  $.post('/lateness_by_station', {
    train: train,station:station
  }).done(function(data) {
    showScheduleForm()
    Cookies.set(train,station)
    $('#schedule-form').html(data)
  }).fail(function() {
    showScheduleForm()
    $('#schedule-form').html("no schedulle available")
  })
}

function showScheduleForm() {
  $('.new-reminder-form').hide();
  $('.edit-reminder-form').remove();
  $('#schedule-form').show()
}

function goBackToSchedule() {
  Cookies.expire(train)
  getStationsForTrain(train)
}
