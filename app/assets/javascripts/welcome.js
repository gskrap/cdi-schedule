$(document).ready(function(){
  $('.btn-huge').click(function(){
    if($(this).find("a").length){window.location.href = $(this).find("a:first").attr("href")};
  })
});
