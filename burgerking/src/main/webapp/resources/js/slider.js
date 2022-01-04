$(document).ready(function(){
    let n = $(".ban > a").length;
	let wd = parseInt($(".sec1").width());
	let ra = wd*-1;
	let itv = setInterval(function(){ lslide(); },4000);
	$(".rightbtn").click(function(){
		clearInterval(itv);
		lslide();
		itv = setInterval(function(){ lslide(); },4000);
	});
	$(".leftbtn").click(function(){
		clearInterval(itv);
		rslide();
		itv = setInterval(function(){ lslide(); },4000);
	});

	function lslide() {
		$("#num_box button").removeClass("on");
		$("#num_box button").eq(0).appendTo($("#num_box"));
		$("#num_box button").eq(0).addClass("on");
		$(".ban").not(":animated").animate({"margin-left":ra+"px"}, 500  , function(){
			$(".ban > a").eq(0).appendTo($(".ban"));
			$(".ban").css("margin-left","0px");
		});		
	};

	function rslide() {
		$("#num_box button").removeClass("on");
		$("#num_box button").eq(n-1).prependTo($("#num_box"));
		$("#num_box button").eq(0).addClass("on");
		$(".ban").css("margin-left",ra+"px");
		$(".ban > a").eq(n-1).prependTo($(".ban"));
		$(".ban").not(":animated").animate({"margin-left":"0px"}, 500);
	}
    });