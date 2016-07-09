// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.class-sort-btn').on('click', function(){
    $('.class-column').hide();
    $('#'+$(this).attr('id').replace('-btn','')+'-column').show()
  })
  $('#show-all-btn').on('click', function(){
    $('.class-column').show();
  })
})