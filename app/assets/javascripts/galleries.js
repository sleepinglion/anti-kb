//= require application
//= require jquery.easing
//= require fancybox
//= require plugin/jquery.uri.js

$(document).ready(function() {
  $("a.simple_image").fancybox({
        'opacity'   : true,
        'overlayShow'        : true,
        'overlayColor': '#000000',
        'overlayOpacity'     : 0.9,
        'titleShow':true,
        'openEffect'  : 'elastic',
        'closeEffect' : 'elastic'
	});

	$('#sl_main_gallery').on('slide.bs.carousel', function(e) {
		var $nextImage = $(e.relatedTarget).find('img');

		$nextImage.each(function(){
			if($(this).attr('data-original')) {
    		$(this).attr('src', $(this).attr('data-original'));
    		$(this).removeAttr('data-original');
			}
  		});
	});

	$('#sl_main_gallery .carousel-inner .active img').each(function(){
			if($(this).attr('data-original')) {
    		$(this).attr('src', $(this).attr('data-original'));
    		$(this).removeAttr('data-original');
			}
	});

  $("#sl_main_gallery .item a").click(function(){
  	var image_url=$("#image_url").val();
    $.getJSON($(this).attr('href'),{'json':true},function(data){
      $("#sl_gallery_left a").attr('href',data.photo.url).attr('title',data.title);
      $("#sl_gallery_left span").text(data.title).css('bottom',-30);
      $("#sl_gallery_left img").attr('src',data.photo.large_thumb.url).animate({ opacity: "1" }, 400,function(){
        $("#sl_gallery_left span").animate({bottom:0,opacity:'0.8'},400);
              });
      $("#sl_gallery_right div:first").html(nl2br(data.content));
      $("#sl_gallery_menu a:first").attr('href','/galleries/edit/'+data.id);
      $("#sl_gallery_menu a:eq(1)").attr('href','/galleries/confirm_delete/'+data.id);
      document.title=data.title+''+'';
      if (history && history.pushState) {
      history.pushState('','gallery_'+data.id,'/galleries/'+data.id);
            }
          });
    return false;
    });
});

function nl2br (str, is_xhtml) {
  var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
  return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}
