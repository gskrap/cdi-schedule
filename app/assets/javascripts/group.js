// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.attendance-btn').on('click', function(){
    $(this).children().toggleClass('btn-default btn-success');
    $(this).parent().toggleClass('not-attending');
  })
  $('.email-btn').on('click', function (event) {
    event.preventDefault();
    var email = "cdiauditions@gmail.com";
    var subject = document.getElementById('class_name_field').value + " - Attendance - " + $($('.varsity')[0]).text();
    var emailBody = "The following students are absent:\n";
    window.location = 'mailto:' + email + '?subject=' + subject + '&body=' +   emailBody;
  });
})