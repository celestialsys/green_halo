/* == chart donut ==*/

		
	$('#chart-donut').highcharts(
		{

			chart: { backgroundColor:'none', border: 'none', margin: [0, 0, 0, 0] },
			colors: ['#669966', '#85b885', '#295c29'],
			credits: { enabled: false },
			plotOptions:
			{
				pie:
				{
					allowPointSelect: true,
					borderWidth: 1,
					cursor: 'pointer',
					dataLabels:
					{
						connectorPadding: 10,
						enabled: true,
						format: '<b>{point.name}</b>: {point.y}',
						style:
						{
							fontFamily: 'Arial',
							fontSize: '10px',
							fontWeight: 'normal'
						},
						useHTML: true 
					},
					slicedOffset: 20,
				}
			},
			series:
			[{
				allowPointSelect: true,
				data:
				[
					[ 'Reused', 172.01 ],
					[ 'Recycled', 3947.45 ],
					[ 'Disposed', 849.58 ],
				],
				type: 'pie',
				innerSize: '50%',
				name: '',
				states: { hover: { enabled: true } }
			}],
			title: { text: '' },
			tooltip:
			{
				backgroundColor: 'rgba(255, 255, 255, 0)', borderWidth: 0, enabled: true, headerFormat: '', shadow: false, useHTML: true,
				formatter: function ()
				{
					return '<span style="color: #fff;"><b>' + this.point.name + '</b>: ' + this.point.y + ' (' + Highcharts.numberFormat(this.percentage, 1) + '%)</span>';
				}
			}
		});
		
		
		
		
		/* == chart line == */
		$('#chart-line').highcharts(
		{
			chart: { backgroundColor: 'none', type: 'line', height: 320, },
			colors: ['#669966', '#85b885', '#295c29'],
			credits: { enabled: false },
			title: { text: '' },
			legend: { enabled: false },
			xAxis: {
				categories: ["Jan '14", "Feb '14", "Mar '14", "Apr '14", "May '14", "Jun '14", "Jul '14", "Aug '14", "Sep '14", "Oct '14", "Nov '14", "Dec '14"],
				labels: { style: { color: '#4c4c4c', font: 'normal 10px Arial' } },
			},
			yAxis: {
				min: 0,
				gridLineDashStyle: 'line',
				gridLineColor: '#d8dadb',
				labels: { style: { color: '#4c4c4c', font: 'normal 10px Arial' } },
				title: { text: 'In Tons', style: { color: '#4c4c4c', font: 'normal 10px Arial' }, margin: 20 }
			},
			plotOptions:
			{
				column:
				{
					borderWidth: 0,
					dataLabels:
					{
						 enabled: true,
						 style: { color: '#fff', fontSize: '10px', fontWeight: 'bold' },
						 y: -3,
					},
					pointPadding: 0.2,
					series: { allowPointSelect: true },
				},
			},
			series:
			[{
				name: 'Reused',
				data: [0, 0, 0, 225.25, 0, 0, 0, 0, 340.34, 0, 0],
				lineWidth: 2,
				marker: { fillColor: '#fff', lineWidth: 2, lineColor: null, radius: 4, symbol: 'circle', },
			},
			{
				name: 'Recycled',
				data: [270.27, 52.25, 25.52, 270.72, 340.43, 430.34, 520.25, 1510.70, 1744.81, 746.58, 520.34, 250.52],
				lineWidth: 2,
				marker: { fillColor: '#fff', lineWidth: 2, lineColor: null, radius: 4, symbol: 'circle', },
			},
			{
				name: 'Disposed',
				data: [52.16, 0, 0, 0, 0, 16.61, 205.07, 25.70, 703.16, 7.07, 0, 17.70],
				lineWidth: 2,
				marker: { fillColor: '#fff', lineWidth: 2, lineColor: null, radius: 4, symbol: 'circle', },
			},
			],
			tooltip:
			{
				backgroundColor: 'rgba(255, 255, 255, 0)', borderWidth: 0, enabled: true, headerFormat: '<span style="color: #fff;"><b>{point.key}</b></span>', pointFormat: '<span style="color: #fff;"><b>{series.name}</b>: {point.y}</span>', shadow: false, useHTML: true
				
			}
		});
	
    	function test() {
			var chart = $('#chart-donut').highcharts();
        //chart.xAxis[0].setColors(['#000']);
        
        	chart.setOptions(
			{
				colors: ['#669966', '#85b885', '#295c29']
			});
		}
		test();
    
