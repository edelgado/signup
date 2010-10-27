$(function(){
	$("div[id^=item_] img").click(function(){
		var needed = $(this).parent().attr('id').split('_')[2];
		var total = $(this).parent().attr('id').split('_')[3];

		if ($(this).hasClass('add')) {
			var curval = $(this).next("input").val();
			if (curval == '' && needed > 0) {
				$(this).next("input").val('1');
				$(this).siblings("img.sub").attr('src', '/images/minus.png');
				$(this).siblings("img.sub").css('display', 'inline');
				if (needed == 1) {
					$(this).attr('src', '/images/plus-muted.png');
				}
				$(this).siblings("div[id$=note]").slideDown();
			} else if (parseInt(curval) < needed) {
				curval++;
				$(this).next("input").val(curval);
				$(this).siblings("div[id$=note]").slideDown();
				if (curval == needed) {
					$(this).attr('src','/images/plus-muted.png');
				} else if (curval < needed ){
					$(this).siblings("img.sub").attr('src', '/images/minus.png');
				}
				$(this).siblings("img.sub").css('display', 'inline');
			}
		}
		
		if ($(this).hasClass('sub')) {
			var curval = $(this).prev("input").val();
			if (curval != '' && curval > 0) {
				curval--;
				if (curval == 0) {
					$(this).prev("input").val('');
					$(this).attr('src', '/images/minus-muted.png');
					$(this).css('display', 'none');
					$(this).siblings("div[id$=note]").slideUp();
				} else {
					$(this).prev("input").val(curval);					
				}
				$(this).siblings("img.add").attr('src', '/images/plus.png');
			}
		}
		
	});		
});