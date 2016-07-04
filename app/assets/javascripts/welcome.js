$(document).ready(function(){
  window.onpopstate = function() {
    $('.btn-huge').css("background-color", "#B6DEFF");
    $('.btn-huge-link').css("background-color", "#B6DEFF");
    $('.link-text').css("background-color", "#B6DEFF");
  }
  $('.btn-huge').on('mouseover', function(){
    $(this).css("background-color", "black");
  });
  $('.btn-huge').on('mouseleave', function(){
    $(this).css("background-color", "#B6DEFF");
  })
  $('.btn-huge').click(function(){
    if($(this).find("a").length){window.location.href = $(this).find("a:first").attr("href")};
  })
});
