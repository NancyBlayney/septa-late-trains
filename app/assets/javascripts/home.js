$(document).ready(function() {

  $('.new-reminder').click(function(e) {
    e.preventDefault();
    $('.edit-reminder-form').remove();
    $('.new-reminder-form').show();
    $('#schedule-form').hide()
    document.getElementById('new-reminder-form').scrollIntoView();
  });

  $('.exit').click(function(e) {
    e.preventDefault();
    $('.new-reminder-form').hide();
      $('#schedule-form').hide();
    document.getElementById('show-page').scrollIntoView()
  });


  $('.edit-reminder').click(function(e) {
    e.preventDefault();
    $('.new-reminder-form').hide();
    $('#schedule-form').hide()
  });

  setTimeout(function() {
    $('.notice, .alert, .advice').remove();
  }, 3000);



});
