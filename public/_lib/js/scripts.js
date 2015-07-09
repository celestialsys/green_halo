$("#video").hide();

$(document).ready(function()
{
	
	setTimeout(function()
	{
		
		
		
		
		
		
		
		
		
		//alert( $(window).width() )
		$("div#loader").hide();
		$("div#cover").fadeOut();
		//location.hash = "home/createaccount";
		
		
		
		
		
		/* ===================== */
		/* == responsive menu == */
		/* ===================== */
		
		$('#nav-small').hide();
		$('#nav-small-button').click(function() { $('#nav-small').slideToggle('fast'); });
		
		$('span.selected-ourproducts').hide();
		$('span.selected-whatwedo').hide()
		$('span.selected-whoweare').hide()
		$('span.selected-demo').hide()
		
		$('a.small-home').click(function() { $('#nav-small').slideUp('fast'); });
		$('a.small-products').click(function() { $('#nav-small').slideUp('fast'); });
		$('a.small-whatwedo').click(function() { $('#nav-small').slideUp('fast'); });
		$('a.small-whoweare').click(function() { $('#nav-small').slideUp('fast'); });
		$('a.small-demo').click(function() { $('#nav-small').slideUp('fast'); });
		$('a.small-chat').click(function() { $('#nav-small').slideUp('fast'); });
		
		
		
		
		/* ======================== */
		/* == full page function == */
		/* ======================== */
		
		$('#fullpage').fullpage(
		{
			anchors: ['home', 'ourproducts', 'whatwedo', 'whoweare', 'scheduleademo'],
			sectionsColor: ['#efefef', '#fff5cc', '#efefef', '#efefef', '#efefef'],
			scrollBar: false,
			scrollOverflow: true,
			//slidesNavigation: true,
			
			afterLoad: function(anchorLink, index){
				var loadedSection = $(this);
				checkURL();
				
				if(index == 1)
				{
					$('span.selected-ourproducts').hide();
					$('span.selected-whatwedo').hide();
					$('span.selected-whoweare').hide();
					$('span.selected-demo').hide();
				}
				if(index == 2)
				{
					$('span.selected-ourproducts').show();
					$('span.selected-whatwedo').hide();
					$('span.selected-whoweare').hide();
					$('span.selected-demo').hide();
				}
				if(index == 3)
				{
					$('span.selected-ourproducts').hide();
					$('span.selected-whatwedo').show();
					$('span.selected-whoweare').hide();
					$('span.selected-demo').hide();
				}
				if(index == 4)
				{
					$('span.selected-ourproducts').hide();
					$('span.selected-whatwedo').hide();
					$('span.selected-whoweare').show();
					$('span.selected-demo').hide();
				}
				if(index == 5)
				{
					$('span.selected-ourproducts').hide();
					$('span.selected-whatwedo').hide();
					$('span.selected-whoweare').hide();
					$('span.selected-demo').show();
				}
			},
			
			afterSlideLoad: function( anchorLink, index, slideAnchor, slideIndex)
			{
				var loadedSlide = $(this);
				checkURL();
			},
			
			onLeave: function(index, nextIndex, direction){
				var leavingSection = $(this);
	
				//after leaving section 2
				if(index == 2 && direction =='up') { $('.fp-controlArrow').hide(); }
			}
			
			
		});
		
		
		
		
		/* ============================ */
		/* == cycle background image == */
		/* ============================ */
		
		$('#slideshow').cycle(
		{
			fx: 'fade',
			pager: '', 
			pause: 0,
			speed: 1700,
			timeout: 2700 
		});	
		
		
		
		
		/* ============ */
		/* == ticker == */
		/* ============ */
		
		jQuery.fn.liScroll=function(e){e=jQuery.extend({travelocity:.07},e);return this.each(function(){function a(e,n){t.animate({left:"-="+e},n,"linear",function(){t.css("left",s);a(o,u)})}var t=jQuery(this);t.addClass("newsticker");var n=1;t.find("li").each(function(e){n+=jQuery(this,e).outerWidth(true)});var r=t.wrap("<div class='mask'></div>");var i=t.parent().wrap("<div class='tickercontainer'></div>");var s=t.parent().parent().width();t.width(n);var o=n+s;var u=o/e.travelocity;a(o,u);t.hover(function(){},function(){var t=jQuery(this).offset();var r=t.left+n;var i=r/e.travelocity;a(r,i)})})}
		
		$(function()
		{
			$("ul#ticker01").liScroll( { travelocity: 0.087 } );
		});
		
		
		
		
		/* ============ */
		/* == ticker == */
		/* ============ */
		
		$('a.video-show').click(function() { $("#video").fadeIn('slow'); } );
		$('a.button-video-close').click(function() { $("#video").fadeOut('slow'); } );
		
		
		
		
		/* =================== */
		/* == social media  == */
		/* =================== */
		
		/* == facebook == */
		$('span.facebook-tip').css("margin-left", "-200px");
		$('img.solution-social-facebook').click(function()
		{
			if($('span.facebook-tip').css("margin-left") == "-200px")
			{
				$('span.facebook-tip').animate( { marginLeft: "0px" }, 670, "easeOutExpo" );
			}
			else
			{
				$('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			}
			$('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
		});
		$('span.facebook-tip').click(function() { $('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" ); });
		
		/* == twitter == */
		$('span.twitter-tip').css("margin-left", "-200px");
		$('img.solution-social-twitter').click(function()
		{
			if($('span.twitter-tip').css("margin-left") == "-200px")
			{
				$('span.twitter-tip').animate( { marginLeft: "0px" }, 670, "easeOutExpo" );
			}
			else
			{
				$('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			}
			$('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
		});
		$('span.twitter-tip').click(function() { $('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" ); });
		
		/* == linkedin == */
		$('span.linkedin-tip').css("margin-left", "-200px");
		$('img.solution-social-linkedin').click(function()
		{
			if($('span.linkedin-tip').css("margin-left") == "-200px")
			{
				$('span.linkedin-tip').animate( { marginLeft: "0px" }, 670, "easeOutExpo" );
			}
			else
			{
				$('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			}
			$('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
		});
		$('span.linkedin-tip').click(function() { $('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" ); });
		
		/* == pinterest == */
		$('span.pinterest-tip').css("margin-left", "-200px");
		$('img.solution-social-pinterest').click(function()
		{
			if($('span.pinterest-tip').css("margin-left") == "-200px")
			{
				$('span.pinterest-tip').animate( { marginLeft: "0px" }, 670, "easeOutExpo" );
			}
			else
			{
				$('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			}
			$('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
		});
		$('span.pinterest-tip').click(function() { $('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" ); });
		
		/* == wordpress == */
		$('span.wordpress-tip').css("margin-left", "-200px");
		$('img.solution-social-wordpress').click(function()
		{
			if($('span.wordpress-tip').css("margin-left") == "-200px")
			{
				$('span.wordpress-tip').animate( { marginLeft: "0px" }, 670, "easeOutExpo" );
			}
			else
			{
				$('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			}
			$('span.facebook-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.twitter-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.linkedin-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
			$('span.pinterest-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" );
		});
		$('span.wordpress-tip').click(function() { $('span.wordpress-tip').animate( { marginLeft: "-200px" }, 470, "easeOutExpo" ); });
		
		function fbs_click()
{u="http://www.wastetracking.com";t="WasteTracking.com – track waste and recycling with WasteTracking.com.";window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','_blank');return false;}
		
		
		
		
		/* ======================= */
		/* == our products menu == */
		/* ====================== */
		
		$('a.construction').click(function()
		{
			$('a.construction').removeClass("default").addClass("selected");
			$('a.buildings').removeClass("selected").addClass("default");
			$('a.government').removeClass("selected").addClass("default");
			$('a.facilities').removeClass("selected").addClass("default");
		});
		$('a.buildings').click(function()
		{
			$('a.construction').removeClass("selected").addClass("default");
			$('a.buildings').removeClass("default").addClass("selected");
			$('a.government').removeClass("selected").addClass("default");
			$('a.facilities').removeClass("selected").addClass("default");
		});
		$('a.government').click(function()
		{
			$('a.construction').removeClass("selected").addClass("default");
			$('a.buildings').removeClass("selected").addClass("default");
			$('a.government').removeClass("default").addClass("selected");
			$('a.facilities').removeClass("selected").addClass("default");
		});
		$('a.facilities').click(function()
		{
			$('a.construction').removeClass("selected").addClass("default");
			$('a.buildings').removeClass("selected").addClass("default");
			$('a.government').removeClass("selected").addClass("default");
			$('a.facilities').removeClass("default").addClass("selected");
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		function checkURL()
		{
			/*if(window.location.href.indexOf("#home") > -1)
			{
				$('#slideshow').fadeIn()
			}
			if(window.location.href.indexOf("#home/createaccount") > -1)
			{
				$('#slideshow').fadeOut()
			}*/
			
			
			
			
			if(window.location.href.indexOf("") > -1)
			{
				$('.fp-controlArrow').hide();
				$('#footer').fadeIn('fast');
			}
			if(window.location.href.indexOf("#") > -1)
			{
				$('.fp-controlArrow').hide();
				$('#footer').fadeIn('fast');
			}
			if(window.location.href.indexOf("#ourproducts") > -1)
			{
				$('.fp-controlArrow').show();
				$('#footer').fadeIn('fast');
			}
			if(window.location.href.indexOf("#whatwedo") > -1)
			{
				$('.fp-controlArrow').show();
				$('#footer').fadeIn('fast');
			}
			if(window.location.href.indexOf("#whoweare") > -1)
			{
				$('.fp-controlArrow').show();
				$('#footer').fadeIn('fast');
			}
			if(window.location.href.indexOf("#scheduleademo") > -1)
			{
				$('.fp-controlArrow').show();
				$('#footer').fadeOut('fast');
			}
			
			
			
			
			if(window.location.href.indexOf("#ourproducts") > -1)
			{
				$('a.construction').removeClass("selected").addClass("selected");
				$('a.construction').removeClass("default").addClass("selected");
				$('a.buildings').removeClass("selected").addClass("default");
				$('a.government').removeClass("selected").addClass("default");
				$('a.facilities').removeClass("selected").addClass("default");
				
				//$("#ourproducts-menu a.arrow-left").animate({ 'margin-top': 190+'px' });
				$("#ourproducts-menu a.arrow-left").click(function()
				{
					window.location.hash = "ourproducts/haulersrecyclingfacilities";
				})
				//$("#ourproducts-menu a.arrow-right").animate({ 'margin-top': 190+'px' });
				$("#ourproducts-menu a.arrow-right").click(function()
				{
					window.location.hash = "ourproducts/buildingownersmanagers";
				})
			}
			if(window.location.href.indexOf("#ourproducts/buildingownersmanagers") > -1)
			{
				$('a.construction').removeClass("selected").addClass("default");
				$('a.construction').removeClass("default").addClass("default");
				$('a.buildings').removeClass("default").addClass("selected");
				$('a.government').removeClass("selected").addClass("default");
				$('a.facilities').removeClass("selected").addClass("default");
				
				//$("#ourproducts-menu a.arrow-left").animate({ 'margin-top': 190+'px' });
				$("#ourproducts-menu a.arrow-left").click(function()
				{
					window.location.hash = "ourproducts";
				})
				//$("#ourproducts-menu a.arrow-right").animate({ 'margin-top': 190+'px' });
				$("#ourproducts-menu a.arrow-right").click(function()
				{
					window.location.hash = "ourproducts/governmentagencies";
				})
			}
			if(window.location.href.indexOf("#ourproducts/governmentagencies") > -1)
			{
				$('a.construction').removeClass("selected").addClass("default");
				$('a.construction').removeClass("default").addClass("default");
				$('a.buildings').removeClass("selected").addClass("default");
				$('a.government').removeClass("default").addClass("selected");
				$('a.facilities').removeClass("selected").addClass("default");
				
				//$("#ourproducts-menu a.arrow-left").animate({ 'margin-top': 178+'px' });
				$("#ourproducts-menu a.arrow-left").click(function()
				{
					window.location.hash = "ourproducts/buildingownersmanagers";
				})
				//$("#ourproducts-menu a.arrow-right").animate({ 'margin-top': 178+'px' });
				$("#ourproducts-menu a.arrow-right").click(function()
				{
					window.location.hash = "ourproducts/haulersrecyclingfacilities";
				})
			}
			if(window.location.href.indexOf("#ourproducts/haulersrecyclingfacilities") > -1)
			{
				$('a.construction').removeClass("selected").addClass("default");
				$('a.construction').removeClass("default").addClass("default");
				$('a.buildings').removeClass("selected").addClass("default");
				$('a.government').removeClass("selected").addClass("default");
				$('a.facilities').removeClass("default").addClass("selected");
				
				//$("#ourproducts-menu a.arrow-left").animate({ 'margin-top': 202+'px' });
				$("#ourproducts-menu a.arrow-left").click(function()
				{
					window.location.hash = "ourproducts/governmentagencies";
				})
				//$("#ourproducts-menu a.arrow-right").animate({ 'margin-top': 202+'px' });
				$("#ourproducts-menu a.arrow-right").click(function()
				{
					window.location.hash = "ourproducts";
				})
			}
		}
		checkURL();	
		
		
		
		
		
		
		
		
		
	}, 170);
	
	
});