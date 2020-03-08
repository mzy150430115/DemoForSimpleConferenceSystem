
 function navWrapsel(){
	var navOffset=$(".nav").offset();
    var navTop=navOffset.top+$(".nav").height();
	var navLeft=navOffset.left;
		var _this = $(".navWrap-sel");
		var index = _this.index();
		//_this.tabClass("navWrap-sel");
		_this.find(".nav2Wrap").css({top:navTop,left:navLeft});
		var posLeft = index*77+42;
		var nav2Width = _this.find(".nav2List").width();
		var nav2Left = 0;
		var posRight = 1000-posLeft;
		if( posLeft >= nav2Width/2){
			nav2Left = posLeft - nav2Width/2;
		} 
		if(posRight < nav2Width/2){
			nav2Left = 1020 - nav2Width - 20;
		}
		_this.find(".nav2List").css({"left":nav2Left+"px"});//.show();
	}
$(function(){ 

	$(".jgfl_li").click(function(){
		var _this = $(this);
		var index = _this.index();
		$(".jgfl_li").eq(index).tabClass("jgfl_liselect");
		$(".conWrap").eq(index).tabClass("conWrap-sel")
	});
	var navOffset=$(".nav").offset();
    var navTop=navOffset.top+$(".nav").height();
	var navLeft=navOffset.left;
	//alert(navLeft);
	//$(".navWrap-sel").find(".nav2Wrap").css({top:navTop,left:navLeft});
	navWrapsel();
	$(".navWrap").mouseover(function(){
		var _this = $(this);
		var index = _this.index();
		_this.tabClass("navWrap-sel");
		_this.find(".nav2Wrap").css({top:navTop,left:navLeft});
		var posLeft = index*77+42;
		var nav2Width = _this.find(".nav2List").width();
		var nav2Left = 0;
		var posRight = 1000-posLeft;
		if( posLeft >= nav2Width/2){
			nav2Left = posLeft - nav2Width/2;
		} 
		if(posRight < nav2Width/2){
			nav2Left = 1020 - nav2Width - 20;
		}
		_this.find(".nav2List").css({"left":nav2Left+"px"});
	});
	
    $('#slides').slides({preload:true,preloadImage:'/dtjs/slides/img/loading.gif',play:5000,pause:2500,hoverPause:true});
 

	//$.slideLi({triggerElm:".bannerCrl>a",listElm:".bannerList",moveUnit:1020,interval:6000,speed:600});
	$.moveLi({listElm:".subjectList",cloneElm:".subjectList>li",layout:"portrait",direction:"prev",moveDtc:17,speed:400,auto:true,interval:6000});
	$.moveLi({listElm:".videoList",cloneElm:".videoList>li",layout:"portrait",direction:"prev",moveDtc:17,speed:400,auto:true,interval:6000});
})

jQuery.fn.extend({

	//元素划过样式切换
	hoverClass : function(className){
		this.each(function(){
			var _this = $(this);
			_this.hover(function(){
				_this.addClass(className);
			},function(){
				_this.removeClass(className);
			})
		})
	},

	//添加类名并且清除同类该类名
	tabClass : function(className) {
		this.each(function(){
			$(this).addClass(className).siblings().removeClass(className);
		})
	}

})

jQuery.extend({

	//队列滚动(固定位置)
	slideLi : function(opt){
		var triggerElm = opt.triggerElm;
		var listElm = opt.listElm;
		var moveUnit = opt.moveUnit;
		var interval = opt.interval;
		var speed = opt.speed;
		var curIndex = 2;
		var length = $(triggerElm).size();
		var yn = true;

		var slideQueue = function(index){
			if(yn){
				yn = false;
				var startPos = -(index - 1) * moveUnit;
				var moveDtc = -index * moveUnit;
				$(triggerElm).eq(index).tabClass("sel");
				$(listElm).css({"left":startPos+"px"})
				$(listElm).animate({"left":moveDtc+"px"},speed,function(){
					yn = true;
				});	
			}
		}

		$(triggerElm).click(function(){
			var idx = $(this).index();
			if(idx != curIndex){
				curIndex = idx
				slideQueue(curIndex);
			}
		});
		var t = setInterval(function(){
			curIndex = curIndex >= 5 ? 2 : (curIndex + 1) ;
			slideQueue(curIndex);
		},interval);
		$(".bannerWrap").mouseover(function(){
			clearInterval(t);
		}).mouseout(function(){
			t = setInterval(function(){
				curIndex = curIndex >= 5 ? 2 : (curIndex + 1) ;
				slideQueue(curIndex);
			},interval);
		});
	},
	
	//队列滚动(固定方向)
	moveLi : function(opt){	
		var triggerElm = opt.triggerElm;
		var listElm = opt.listElm;
		var cloneElm = opt.cloneElm;
		var layout = opt.layout;
		var direction = opt.direction;
		var speed = opt.speed;
		var moveDtc = opt.moveDtc;
		var auto = opt.auto;
		var interval = opt.interval;
		var yn = true;
		var bgClass = 1;

		var moveQueue = function(){
			if(yn){
				yn = false;
				var _listElm = $(listElm);
				var _wrapElm = _listElm.parent().parent();
				if(_listElm.css("left")){
					var _left = parseFloat(_listElm.css("left").replace("px",""));
				}
				if(_listElm.css("top")){
					var _top = parseFloat(_listElm.css("top").replace("px",""));
				}
				var _length = $(cloneElm).size();
				if(direction == "prev"){	
					if(layout == "horizontal"){			
						_listElm.animate({"left":"-="+moveDtc},speed,function(){	
							_listElm.append(_listElm.find("li").eq(0).clone());
							_listElm.find("li").eq(0).remove();
							_listElm.css({"left":_left+"px"});
							if(_wrapElm.hasClass("mod3_s")){
								_wrapElm.removeClass("bg"+bgClass+"");
								if(bgClass == 3){
									bgClass = 1;
								}
								else{
									bgClass ++;
								}
								_wrapElm.addClass("bg"+bgClass+"");
							}
							yn = true;
						});
					}
					if(layout == "portrait"){			
						_listElm.animate({"top":"-="+moveDtc},speed,function(){		
							_listElm.append($(cloneElm).eq(0).clone());
							$(cloneElm).eq(0).remove();
							_listElm.css({"top":_top+"px"});
							yn = true;
						});
					}
				}
				if(direction == "next"){
					_listElm.prepend($(cloneElm).eq(_length-1).clone());
					_length = $(cloneElm).size();
					_left -= moveDtc;
					_listElm.css({"left":_left+"px"});
					$(cloneElm).eq(_length-1).remove();
					_listElm.animate({"left":"+="+moveDtc},speed,function(){		
						yn = true;
					});
				}
			}		
		}

		if(!auto){
			$(triggerElm).click(function(){
				moveQueue();		
			});
		}
		else{
			var t = setInterval(function(){
				moveQueue();
			},interval);
			$(listElm).mouseover(function(){
				clearInterval(t);
			}).mouseout(function(){
				t = setInterval(function(){
					moveQueue();
				},interval);
			});
		}

	}

})