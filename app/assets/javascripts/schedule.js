$(document).ready(function() {
  $('.sched-btn').click(function(e) {
     train = $(e.target).data('train')
     if (Cookies.get(train)) {
       station=Cookies.get(train)
       getScheduleForStation(train,station)
     }else{
       getStationsForTrain(train)
     }
  })
});

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


// if (Cookies.get('name')) {
//      $('body').append(Cookies.get('name'))
//      $('#btn').html('Remove cookie')
//      $('#btn').click(removeCookie)
//      $("#btn").animate({
//          opacity: 0.55,
//          left: "+=50",
//          height: "toggle"
//      }, 1000)
//  } else {
//      $('#btn').html('Set cookie')
//      $('#btn').click(setCookie)
//  }

// function setCookie() {
//     Cookies.set('name', $('#name').val())
// }
