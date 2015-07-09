$(document).ready(function()
{
	
	
	
	
	
	
	
	
	
	$('#chart-donut-test').highcharts(
		{
			colors: ['#333', '#000', '#666'],
		});
	
	/* ========================== */
	/* == global nav functions == */
	/* ========================== */
	
	/* == global nav == */
	$('.nav-create').hover(
		function() { $('img.global-nav-add').stop(true, true).hide(); $('img.global-nav-add-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-add-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-add').stop(true, true).show(); }
	);
	$('.nav-home').hover(
		function() { $('img.global-nav-projects').stop(true, true).hide(); $('img.global-nav-projects-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-projects-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-projects').stop(true, true).show(); }
	);
	$('.nav-statistics').hover(
		function() { $('img.global-nav-statistics').stop(true, true).hide(); $('img.global-nav-statistics-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-statistics-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-statistics').stop(true, true).show(); }
	);
	$('.nav-settings').hover(
		function() { $('img.global-nav-settings').stop(true, true).hide(); $('img.global-nav-settings-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-settings-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-settings').stop(true, true).show(); }
	);
	$('.nav-recycler-search').hover(
		function() { $('img.global-nav-recycler-search').stop(true, true).hide(); $('img.global-nav-recycler-search-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-recycler-search-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-recycler-search').stop(true, true).show(); }
	);
	$('.nav-suggestions').hover(
		function() { $('img.global-nav-suggestions').stop(true, true).hide(); $('img.global-nav-suggestions-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-suggestions-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-suggestions').stop(true, true).show(); }
	);
	$('.nav-report-bug').hover(
		function() { $('img.global-nav-report-bug').stop(true, true).hide(); $('img.global-nav-report-bug-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-report-bug-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-report-bug').stop(true, true).show(); }
	);
	$('.nav-live-help').hover(
		function() { $('img.global-nav-live-help').stop(true, true).hide(); $('img.global-nav-live-help-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-live-help-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-live-help').stop(true, true).show(); }
	);
	$('.nav-log-out').hover(
		function() { $('img.global-nav-log-out').stop(true, true).hide(); $('img.global-nav-log-out-hover').stop(true, true).animate( { marginTop: "-14px" }, 170 ); },
		function() { $('img.global-nav-log-out-hover').stop(true, true).css( { marginTop: "50px" } ); $('img.global-nav-log-out').stop(true, true).show(); }
	);
	
	
	
	
	
	
	
	
	
	/* ============================= */
	/* == date/time filter/picker == */
	/* ============================= */
	
	if (top.location != location) { top.location.href = document.location.href ; }
	
	// date picker on statistic pages
	$('#filter-from').datepicker().on('changeDay', function (e) { $('#filter-from').datepicker('hide'); });
	$('#filter-to').datepicker().on('changeDay', function (e) { $('#filter-to').datepicker('hide'); });
	$('#filter-from2').datepicker().on('changeDay', function (e) { $('#filter-from2').datepicker('hide'); });
	$('#filter-to2').datepicker().on('changeDay', function (e) { $('#filter-to2').datepicker('hide'); });
	
	// date picker on add project
	$('#start-date').datepicker().on('changeDay', function (e) { $('#start-date').datepicker('hide'); });
	$('#end-date').datepicker().on('changeDay', function (e) { $('#end-date').datepicker('hide'); });
	
	// date picker on add ticket page
	$('input#input-ticket-date').datepicker().on('changeDay', function (e) { $('#input-ticket-date').datepicker('hide'); });
	
	
	
	
	
	
	
	
	
	/* ============================ */
	/* == modal window functions == */
	/* ============================ */
	
	$('#modal-add-project-verification').hide();
	$('.zip-postal-code-button').click(function() { $('#modal-add-project-container').hide(); $('#modal-add-project-verification').fadeIn(); })
	$('.zip-postal-code-reenter').click(function() { $('#modal-add-project-verification').hide(); $('#modal-add-project-container').fadeIn(); })
		
	$('#modal-suggestions-thankyou').hide();
	$('.submit-suggestions').click(function() { $('#modal-suggestions-form').hide(); $('#modal-suggestions-thankyou').fadeIn(); })
	
	$('#modal-reportbugs-thankyou').hide();
	$('.submit-bug').click(function() { $('#modal-reportbugs-form').hide(); $('#modal-reportbugs-thankyou').fadeIn(); })
	
	$('a.close-reveal-modal').click(function()
	{
		setTimeout(function()
		{
			$('#modal-add-project-container').show(); $('#modal-add-project-verification').hide();
			$('#modal-suggestions-form').show(); $('#modal-suggestions-thankyou').hide();
			$('#modal-reportbugs-form').show(); $('#modal-reportbugs-thankyou').hide();
		},670);
	})
	
	
	
	
	
	
	
	
	
	/* =========================== */
	/* == open / close collapes == */
	/* =========================== */
	
	$('.collapse').on('shown.bs.collapse', function()
	{
		$(this).parent().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
	});
	$('.collapse').on('hidden.bs.collapse', function()
	{
		$(this).parent().find(".glyphicon-chevron-up").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	});
	
	
	
	
	
	
	
	
	
	/* ====================== */
	/* == add ticket entry == */
	/* ====================== */
	
	$('#btn-remove').hide();
	$('#btn-add-ticket-entry').click(function ()
	{
		var num = $('.clonedInput').length, // how many "duplicatable" input fields we currently have
		newNum  = new Number(num + 1),      // the numeric ID of the new input field being added
		newElem = $('#entry' + num).clone().attr('id', 'entry' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value
		
		// manipulate the name/id values of the input inside the new element
        // ticket number
        newElem.find('.input-ticket-number').attr('id', 'ID' + newNum + '-input-ticket-number').attr('name', 'ID' + newNum + '-input-ticket-number').val('');
		// material
        newElem.find('.select-material').attr('id', 'ID' + newNum + '-select-material').attr('name', 'ID' + newNum + '-select-material').val('');
		// facility
        newElem.find('.select-facility').attr('id', 'ID' + newNum + '-select-facility').attr('name', 'ID' + newNum + '-select-facility').val('');
		// ticket image
        //newElem.find('.input-ticket-image').attr('id', 'ID' + newNum + '-input-ticket-image').attr('name', 'ID' + newNum + '-input-ticket-image').val('');
		// ticket date
        newElem.find('.input-ticket-date').attr('id', 'ID' + newNum + '-input-ticket-date').attr('name', 'ID' + newNum + '-input-ticket-date').val('');
		// ticket weight
        newElem.find('.input-ticket-weight').attr('id', 'ID' + newNum + '-input-ticket-weight').attr('name', 'ID' + newNum + '-input-ticket-weight').val('');
		newElem.find('.select-weight').attr('id', 'ID' + newNum + '-select-weight').attr('name', 'ID' + newNum + '-select-weight').val('');
		// ticket percentage
        newElem.find('.input-ticket-percentage').attr('id', 'ID' + newNum + '-input-ticket-percentage').attr('name', 'ID' + newNum + '-input-ticket-percentage').val('');
		
		$('#entry' + num).after(newElem);
		$('#ID' + newNum + '_title').focus();
		$('#btn-remove').show();
	 	$('#btn-remove').attr('disabled', false);
		
		//if (newNum == 5)
		//$('#btn-add-ticket-entry').attr('disabled', true).prop('value', "You've reached the limit");
		
		$('.number').text(function( index )
		{
			return "" + ( index + 1 );
		});
		
		$('#btn-remove').click(function ()
		{
			var num = $('.clonedInput').length;
			$('#entry' + num).slideUp('slow', function ()
			{
				$(this).remove();
				f (num -1 === 1)
				$('#btn-remove').attr('disabled', true);
				$('#btn-add-ticket-entry').attr('disabled', false).prop('value', "add section");
			});
			return false;
			$('#btn-add-ticket-entry').attr('disabled', false);
		});
	 
		$('#btn-remove').attr('disabled', true);
    });
	
	
	
	
	
	
	
	
	
	/* ================================================== */
	/* == dynamically shorten text with show more link == */
	/* ================================================== */
	
	var showChar = 150;
    var dotdotdot = "...";
    var moretext = "more";
    var lesstext = "less";
    $('.more').each(function()
	{
		var content = $(this).html();
 
        if(content.length > showChar)
		{
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + dotdotdot+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
	});
 
    $(".morelink").click(function()
	{
		if($(this).hasClass("less"))
		{
            $(this).removeClass("less");
            $(this).html(moretext);
        }
		else
		{
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
	
	
	






});
