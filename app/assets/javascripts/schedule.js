$(document).ready(function(){
alert('works')
$.post('/schedule'

).done(function(data){
  $('.col2').append(data)

})
})
