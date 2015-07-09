<?php

	$name 		= $_POST['form-name'];
	$tracking	= $_POST['form-tracking'];
	$projects	= $_POST['form-numberofprojects'];
	$email 		= $_POST['form-email'];
	$phone		= $_POST['form-phone'];
	$date		= $_POST['form-date'];
	$time 		= $_POST['form-time'];
	$ampm 		= $_POST['form-ampm'];
	$zone 		= $_POST['form-zone'];
	
	$formcontent=" From: $name \n What am I tracking: $tracking \n # of projects I want to track: $projects \n Email: $email \n Phone: $phone \n\n Requested Date: $date \n Best time to call: $time $ampm \n Time Zone: $zone \n";
	
	//$recipient = "dean@wastetracking.com, jeaton@wastetracking.com";
	$recipient = "dean@wastetracking.com";
	$subject = "[GH Site] Waste Tracking Web Demo Request";
	$mailheader = "From: $email \n\n";
	$from_email_address = "$email";
	
	//mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");
	//mail($recipient, $subject, $formcontent, $mailheader);
	mail($recipient, $subject, $formcontent, $mailheader, "-f $from_email_address");
	
	echo '<script type="text/javascript">alert("Thank you! Your information has been sent."); function refreshpage(){ window.open("form-demo.html", "_self"); } refreshpage();</script>';
?>