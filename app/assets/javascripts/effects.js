$(document).ready(function () {
  $('.hide_this').hide();
  $("#new_char_button").click(function(){
    $('.hide_this').slideDown("fast");
  });
});
