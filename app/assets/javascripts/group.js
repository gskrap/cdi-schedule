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
    var emailBody = "The following students are absent:%0D%0A%0D%0A";
    for( var i = 0; i < $('.not-attending').length; i++ ) {
      emailBody += $($($('.not-attending')[i]).find('.student-name > .full-name > p')[0]).text();
      emailBody += "%0D%0A"
      emailBody += "Reason: %0D%0A%0D%0A"
    }
    window.location = 'mailto:' + email + '?subject=' + subject + '&body=' + emailBody;
  });
})