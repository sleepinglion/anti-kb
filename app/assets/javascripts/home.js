//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.easing
//= require fancybox


$(document).ready(function() {
    $(".scrollable").scrollable({
        circular: true,
        mousewheel: true
    }).navigator().autoscroll({
        interval: 3000
	});
    


    $("a.simple_image").fancybox({
        'opacity'   : true,
        'overlayShow'        : true,
        'overlayColor': '#000000',
        'overlayOpacity'     : 0.9,
        'titleShow':true,
        'openEffect'  : 'elastic',
        'closeEffect' : 'elastic'
        });


    $('#sign_now').popover();
});
