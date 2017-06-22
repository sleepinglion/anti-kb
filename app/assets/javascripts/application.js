  //= require jquery
//= require jquery_ujs
//= require plugin/jquery.uri.js
//= require fancybox
//= require bootstrap-sprockets

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

  $('#sign_now').popover();

    $('#myModal').on('hidden.bs.modal', function () {
        $(this).removeData('bs.modal');
    });

	$('.modal_link').click(function(event){
  	event.preventDefault();
  	$('#myModal').removeData("modal");
  	$('#myModal').load($(this).attr('href')+'?no_layout=true',function(){
  		$('#myModal').modal();
  		});
    return false;
	});

  $("#report_main tbody tr,#compliment_main tbody tr").click(function(){
    location.href=$(this).find('a:first').attr('href');
  });


  $(".comment_form_only").click(function(){
    if($(this).parent().find('.comment_layer').length) {
      var comment_layer=$(this).parent().find('.comment_layer');
      if(comment_layer.is(':visible')) {
        comment_layer.slideUp();
      } else {
        comment_layer.slideDown();
      }
    } else {
      var mb=$(this).parent();
      var uid=$(this).parent().find('a:first').attr('href').split('/').pop();

      mb.append($('<div class="comment_layer"><div class="comment_form"></div><div class="comment_list"></div></div>'));
      mb.find('.comment_form').load($(this).attr('href')+'?no_layout=true',function(){
        $(this).find('form').submit(function(){
          var comment=$(this).find('textarea').val();
          $.post($(this).attr('action')+'.json',{'id':$(this).find('input[name="id"]').val(),'comment[comment]':comment},function(data){
            mb.find('textarea').val('');
            var new_comment=$('<h5>'+$("#username").text()+'</h5><div class="comment">'+nl2br(comment)+'</div>');
            mb.find('.comment_list').append(new_comment);
            new_comment.highlight();
          });
          return false;
        });
      });
    }
    return false;
  });

  $(".comment_form_with_list").click(function(){
    if($(this).parent().find('.comment_layer').length) {
      var comment_layer=$(this).parent().find('.comment_layer');
      if(comment_layer.is(':visible')) {
        comment_layer.slideUp();
      } else {
        comment_layer.slideDown();
      }
    } else {
      var mb=$(this).parent();
      var uid=$(this).parent().find('a:first').attr('href').split('/').pop();

      mb.append($('<div class="comment_layer"><div class="comment_form"></div><div class="comment_list"></div></div>'));
      mb.find('.comment_form').load($(this).attr('href')+'?no_layout=true',function(){
        $(this).find('form').submit(function(){
          var comment=$(this).find('textarea').val();
          $.post($(this).attr('action')+'.json',{'id':$(this).find('input[name="id"]').val(),'comment[comment]':comment},function(data){
            mb.find('textarea').val('');
            var new_comment=$('<h5>'+$("#username").text()+'</h5><div class="comment">'+nl2br(comment)+'</div>');
            mb.find('.comment_list').append(new_comment);
            new_comment.highlight();
          });
          return false;
        });
      });

		  $.getJSON($(this).parent().find('a:first').attr('href')+'.json',function(data){
        if(data.length) {
          $.each(data,function(index,value) {
            mb.find('.comment_list').append($('<h5>'+value.username+'</h5><div class="comment">'+nl2br(value.comment)+'</div>'));
          });
        }
      });
    }
    return false;
  });


	$("#faqCategoryList a.title").click(getList);
	$("#faqList dt a.title").click(getContent);

	function getList() {
		var tt=$(this);
		var parent=$(this).parent();

		$.getJSON($(this).attr('href')+'.json',function(data){
			$("#faqList").empty();
			if(data.faqs.length) {
				$.each(data.faqs,function(index,value){
					var a=$('<a class="title" href="/faqs/'+value.id+'">'+value.title+'</a>').click(getContent);
					if(data.admin) {
						var div=$('<div class="sl_faq_menu"><a>수정</a> &nbsp; | &nbsp; <a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
						div.find('a:first').attr('href','/faqs/'+value.id+'/edit');
						div.find('a:eq(1)').attr('href','/faqs/'+value.id);
						$('<dt>').appendTo("#faqList").append(a).append(div);
					} else {
						$('<dt>').appendTo("#faqList").append(a);
					}
				});
			} else {
				$('<dt>글이 없습니다.</dt>').appendTo("#faqList");
			}

			$("#faqCategoryList li").removeClass('on');
			parent.addClass('on');

			var faqCategoryId=$.uri.setUri(tt.attr('href')).param("faq_category_id");

			if(data.admin) {
				$("#faqCategoryList li .sl_faq_category_menu").remove();
				var dd=$('<div class="sl_faq_category_menu"><a>수정</a><br /><a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
				dd.find('a:first').attr('href','/faq_categories/'+faqCategoryId+'/edit');
				dd.find('a:eq(1)').attr('href','/faq_categories/'+faqCategoryId);
				parent.append(dd);
			}

			$('#sl_bottom_menu a:eq(1)').attr('href','/faqs/new?faq_category_id='+faqCategoryId);
		});
		return false;
	}

	function getContent(){
		var parent=$(this).parent();
		$.getJSON($(this).attr('href')+'.json',function(value){
			if(parent.next().get(0)) {
				if(parent.next().get(0).tagName!='DD') {
					parent.after('<dd>');
				}
			} else {
				parent.after('<dd>');
			}
			$("#faqList dt").removeClass('on');
			$("#faqList dd").hide();
			parent.addClass('on');
			parent.next().html('<p>'+nl2br(value.content)+'</p>').slideDown();
		});

		return false;
	}

  function nl2br (str, is_xhtml) {
  	  var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
  	  return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
  }
});

jQuery.fn.highlight = function() {
   $(this).each(function() {
        var el = $(this);
        el.before("<div/>")
        el.prev()
            .width(el.width())
            .height(el.height())
            .css({
                "position": "absolute",
                "background-color": "#ffff99",
                "opacity": ".9"
            })
            .fadeOut(500);
    });
}
