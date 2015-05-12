$(function(){
	
	$("a.search").click(function(){
		if ($(this).attr("id")=="search" && $(this).hasClass("active"))
		{
			if ($(this).prev("form").children(".input-content").children("input").val()=="")
			{
				$(this).prev("form").children(".input-content").children("input").show().animate({"margin-left": '+=141'},300);
				$(this).prev("form").show(300);
				$(this).attr("id","");
				$(this).removeClass("active");
			}else 
			{
				$("form#search").submit();
			}
		}else
		{
			$(this).prev("form").show();
			$(this).prev("form").children(".input-content").children("input").show().animate({"margin-left": '-=141'},300);
			//$(this).hide();
			$(this).addClass("active");
			$(this).attr("id","search");			
		}
		
		return false;
	});
	
	
	
	$("li.disabled").click(function(){ return false; });

	$(window).scroll(function(){
		if ($(this).scrollTop() > 490) {
			$('.scrollToTop').fadeIn();
		} else {
			$('.scrollToTop').fadeOut();
		}
	});
	
	$('.scrollToTop').click(function(){
		$('html, body').animate({scrollTop : 0},500);
		return false;
	});
	
	$(".slidedown").click(function(){
		height = $("#slide").height();
		$('html, body').animate({scrollTop : height},500);
		return false;
	});
	
	$(".responsive-nav-btn").click(function(){
		$(".responsive-navigasyon , .responsive-focus").show();
	});
	$(".responsive-focus").click(function(){
		$(".responsive-navigasyon , .responsive-focus").hide();
	});
	
	$(window).resize(function(){
		
		if ($(window).width()>=991) {
			$(".responsive-navigasyon , .responsive-focus").hide();
		}
		
	});

	
});