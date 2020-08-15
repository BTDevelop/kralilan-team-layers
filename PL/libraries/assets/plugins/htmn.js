$(document).ready(function(){
	$('.map-area').height( $(window).height() - $('.header').height() );
	$('.map-area .map').height( $(window).height() - $('.header').height() );

	$.ajaxSetup({ cache: false });

	function Blank(){
		$('.blank').each(function(){
			$(this).attr("target","_blank");
		});
	}

	$('.blank').each(function(){
		$(this).attr("target","_blank");
	});

	$('.nav-tabs a').click(function(e){
		e.preventDefault();
		var id=$(this).attr('href');
		var link = $(this).attr('link');
		$(this).parent().parent().next().find(id).load(link,function(){
			$(".select2").select2();
			Blank();
		});
		$(this).tab('show');
	    
	});

	
	var width = $(window).width();
	var leftwidth = $('.left-list').width();
	var rightwidth = $('.right-list').width();
	var legend=$("#legend").height();

	if(width<769){
		$('.left-list').css('left','-'+leftwidth+'px');
		$('.slide-a-left').addClass('kapali');
		$('.slide-a-left').css('left','0');
		$('.right-list').css('right','-'+rightwidth+'px');
		$('.slide-a-right').addClass('kapali');
		$('.slide-a-right').css('right','0');
		$("#legend").css("bottom","-"+legend+"px");
        $('#filtre-btn').css('left','-'+leftwidth+'px');

	}

	$("#legend #open-legend span").on("click",function(){
	    if($(this).parent().hasClass("off")){
	        $(this).parent().removeClass("off");
	        $(this).parent().addClass("on");
	        $("#legend").animate({"bottom":"0"});
	    }else{
	        $(this).parent().addClass("off");
	        $(this).parent().removeClass("on");
	        $("#legend").animate({"bottom":"-"+legend});
	    }
	});

	$('.slide-a-left').on('click',function(){
		if(!$('.slide-a-right').hasClass('kapali')){
			if(width<769){
				$('.slide-a-right').addClass('kapali');
				$('.slide-a-right').animate({"right":"0"},"fast");
				$('.right-list').animate({"right":"-"+rightwidth},"fast");
			}
		}
		if($(this).hasClass('kapali')){
			$(this).removeClass('kapali');
			$(this).animate({"left":leftwidth},"fast");
			$('.left-list').animate({"left":"0"},"fast");
			$('#filtre-btn').animate({"left":"0"},"fast");
		}else{
			$(this).addClass('kapali');
			$(this).animate({"left":"0"},"fast");
			$('.left-list').animate({"left":"-"+leftwidth},"fast");
			$('#filtre-btn').animate({"left":"-"+leftwidth},"fast");
		}
	});

	$('.slide-a-right').on('click',function(){
		if(!$('.slide-a-left').hasClass('kapali')){
			if(width<769){
				$('.slide-a-left').addClass('kapali');
				$('.slide-a-left').animate({"left":"0"},"fast");
				$('.left-list').animate({"left":"-"+leftwidth},"fast");
			    $('#filtre-btn').animate({"left":"-"+leftwidth},"fast");
			}
		}
		if($(this).hasClass('kapali')){
			$(this).removeClass('kapali');
			$(this).animate({"right":rightwidth},"fast");
			$('.right-list').animate({"right":"0"},"fast");
		}else{
			$(this).addClass('kapali');
			$(this).animate({"right":"0"},"fast");
			$('.right-list').animate({"right":"-"+rightwidth},"fast");
		}
	});


	
});

$(window).resize(function(){
	$('.map-area .map').height( $(window).height() - $('.header').height() );
	var width = $(window).width();
	var leftwidth = $('.left-list').width();
	var rightwidth = $('.right-list').width();
	var legend=$("#legend").height();
	
	if(width<769){
		$('.left-list').css('left','-'+leftwidth+'px');
		$('#filtre-btn').css('left','-'+leftwidth+'px');
		$('.slide-a-left').addClass('kapali');
		$('.slide-a-left').css('left','0');
		$('.right-list').css('right','-'+rightwidth+'px');
		$('.slide-a-right').addClass('kapali');
		$('.slide-a-right').css('right','0');
		$("#legend").css("bottom","-"+legend+"px");
	}
});