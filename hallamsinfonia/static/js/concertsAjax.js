$(function(){

  // Bind the event.
  $(window).hashchange( function() {
    $( "#upcoming-detail" ).fadeOut("fast", function() {
      hash = location.hash.replace( /^#/, '' ) || 'blank';
      if (hash != 'blank') {
        $( "#upcoming-detail" ).load( "/upcoming/" + hash + "/", loadCallback);
      }
    });
  });

  // Trigger the event (useful on page load).
  $(window).hashchange();
});

function loadCallback() {
  $( "#upcoming-detail" ).fadeIn();
  var target = ($("#upcoming-detail").offset().top - 10);
  var current = $(document).scrollTop();
  if (Math.abs(target - current) > 50) {
    $('html, body').animate({scrollTop: target}, 600);
  }
}

$('#concerts-listview h3').click( function() {
  var s = $(this).find('.arrow');
  $(this).siblings('.hidden-concerts-table').fadeToggle("fast", function() {
    if ($(this).is(':visible')) {
      s.html('í');
    } else {
      s.html('ì');
    }
  });
});
