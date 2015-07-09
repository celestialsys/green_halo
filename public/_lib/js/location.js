jQuery(function($)
{
	var script = document.createElement('script');
	script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
	document.body.appendChild(script);
});
function initialize()
{
	var map;
	var bounds = new google.maps.LatLngBounds();
	var mapOptions =
	{
		draggable: true,
		mapTypeControl: true,
		mapTypeControlOptions:
		{
			style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
			position: google.maps.ControlPosition.TOP_RIGHT
		},
		mapTypeId: 'roadmap',
		navigationControl: true,
		panControl: false,
		panControlOptions:
		{
			position: google.maps.ControlPosition.TOP_RIGHT
		},
		scaleControl: true,
		scrollwheel: false,
		zoomControl: true,
		zoomControlOptions:
		{
			style: google.maps.ZoomControlStyle.LARGE,
			position: google.maps.ControlPosition.RIGHT_CENTER
		}
	};
	
	
	map = new google.maps.Map(document.getElementById("whoweare-map"), mapOptions);
	map.setTilt(45);
	
	var markers =
	[
		['greenhalo headquarters', 37.383561, -121.914503, 1]
	];
	
	var infoWindowContent =
	[
		/*['<div class="info_content" style="color: 3c3c3c; font: normal 11px CustomFont; margin: 0; overflow-y: hidden; padding: 7px 0px 0px 0px; text-align: center; width: 270px; height: 57px;">' +
		'<p><b>CODE77&reg;</b></p>' +
		'<p style="color: #676767;">****&nbsp;&nbsp;La&nbsp;&nbsp;Selva&nbsp;&nbsp;Street,&nbsp;&nbsp;Ste&nbsp;&nbsp;C,&nbsp;&nbsp;San&nbsp;&nbsp;Mateo,&nbsp;&nbsp;CA&nbsp;&nbsp;94403</p>' +
		'<p style="color: #676767;">eflores@code77.com&nbsp;&nbsp;&nbsp;&ndash;&nbsp;&nbsp;&nbsp;510 507 9577</p>' + '</div>'],
		['<div class="info_content" style="color: 3c3c3c; font: normal 11px CustomFont; overflow-y: hidden; text-align: center; width: 270px; height: 37px;">' +
		'<p><b>CODE77&reg;</b></p>' + '<p>eflores@code77.com&nbsp;&nbsp;&nbsp;&ndash;&nbsp;&nbsp;&nbsp;510 507 9577</p>' + '</div>']*/
	];
	
	var infoWindow = new google.maps.InfoWindow(), marker, i;
	for( i = 0; i < markers.length; i++ )
	{
		var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
		bounds.extend(position);
		marker = new google.maps.Marker(
		{
			position: position,
			map: map,
			title: markers[i][0],
			icon: '_images/global/map-pin.png'
		});
		
		google.maps.event.addListener(marker, 'click', (function(marker, i)
		{
			return function()
			{
				infoWindow.setContent(infoWindowContent[i][0]);
				infoWindow.open(map, marker);
			}
		})(marker, i));
		
		map.fitBounds(bounds);
	}
	
	var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event)
	{
		this.setZoom(11);
		google.maps.event.removeListener(boundsListener);
	});
	
	var styles = [
	  {
		stylers: [
		  { hue: "#000" },
		  { saturation: -100 }
		]
	  },{
		featureType: "road",
		elementType: "geometry",
		stylers: [
		  { lightness: -25 },
		  { visibility: "simplified" }
		]
	  },{
		featureType: "road",
		elementType: "labels",
		stylers: [
		  { visibility: "off" }
		]
	  }
	];
	map.setOptions({styles: styles});
}