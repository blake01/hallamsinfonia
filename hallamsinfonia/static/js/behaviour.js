$("#dagger-area").click(function() {
  $("#main_container").fadeToggle();
});
$(".meso_container").click(function() {
  $("#main_container").fadeIn();
});
function check_sticky_footer() {
  available_height = $(window).height() - $("#meta_container").height();
  $("#main_container").css("min-height", $("#main_container").height() + available_height);
}
$( window ).resize(function() {
  check_sticky_footer();
});
$( window ).load(function() {
  check_sticky_footer();
});
