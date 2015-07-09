<?php

	$name 		= $_POST['form-name'];
	$email 		= $_POST['form-email'];
	$message	= $_POST['form-message'];
	
	$formcontent=" From: $name \n Email: $email \n Message: $message";
	
	//$recipient = "dean@wastetracking.com, jeaton@wastetracking.com";
	$recipient = "dean@wastetracking.com";
	$subject = "[GH Site] Get In Touch";
	$mailheader = "From: $email \n\n";
	$from_email_address = "$email";
	
	//mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");
	//mail($recipient, $subject, $formcontent, $mailheader);
	mail($recipient, $subject, $formcontent, $mailheader, "-f $from_email_address");
	
	echo '<script type="text/javascript">alert("Thank you! Your information has been sent."); function refreshpage(){ window.open("form-contact.html", "_self"); } refreshpage();</script>';
?>