(function($){

  $('#images ul li a').click(function(event) {
    event.preventDefault();
    var new_image = $(this).attr('href');
    $('#iphone-img').fadeOut(function() {
      $(this).attr('src', new_image).fadeIn();
    });
  });
  
  gaq_track_events();


})(this.jQuery);


//http://code.google.com/apis/analytics/docs/tracking/asyncMigrationExamples.html#VirtualPageviews
//http://code.google.com/apis/analytics/docs/tracking/eventTrackerGuide.html
function gaq_track_events() {
  
  $('a.button').click(function() {
    _gaq.push(['_trackEvent', 'Button', 'Click', $(this).attr('href')]);
  });

  $('#images ul li').click(function() {
    _gaq.push(['_trackEvent', 'Image Gallery', 'Click', $(this).attr('href')]);
  });
    
};