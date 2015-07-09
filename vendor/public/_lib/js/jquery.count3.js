(function ($)
{
	$.fn.countTo3=function(e){e=e||{};return $(this).each(function(){function f(){u+=r;o++;l(u);if(typeof t.onUpdate=="function"){t.onUpdate.call(i,u)}if(o>=n){s.removeData("countTo3");clearInterval(a.interval);u=t.to;if(typeof t.onComplete=="function"){t.onComplete.call(i,u)}}}function l(e){var n=t.formatter.call(i,e,t);s.text(n)}var t=$.extend({},$.fn.countTo3.defaults,{from:$(this).data("from"),to:$(this).data("to"),speed:$(this).data("speed"),refreshInterval:$(this).data("refresh-interval"),decimals:$(this).data("decimals")},e);var n=Math.ceil(t.speed/t.refreshInterval),r=(t.to-t.from)/n;var i=this,s=$(this),o=0,u=t.from,a=s.data("countTo3")||{};s.data("countTo3",a);if(a.interval){clearInterval(a.interval)}a.interval=setInterval(f,t.refreshInterval);l(u)})}

	var date = new Date();
	//var newVisit = date.getDate() + 37500; 
	var newVisit = date.getDate() + 30000;
	$.fn.countTo3.defaults =
	{
		from:				0,								// the number the element should start at
		to:					125675893 + newVisit,			// the number the element should end at
		speed:				2700,							// how long it should take to count between the target numbers
		refreshInterval:	100,							// how often the element should be updated
		decimals:			0,								// the number of decimal places to show
		formatter:			formatter,						// handler for formatting the value before rendering
		onUpdate:			null,							// callback method for every time the element is updated
		onComplete:			null							// callback method for when the element finishes updating
	};

	function formatter(value, settings) { return value.toFixed(settings.decimals); }
}
(jQuery));