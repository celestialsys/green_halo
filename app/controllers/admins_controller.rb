class AdminsController < ApplicationController
#before_filter :authenticate_user!
  #before_action :authenticate_temporary_user!
 
 def dashboard
 	render :action => 'dashboard'
 end

 def successful_confirmation
 end

 def account_confirmed
 end

 def form
	render "admins/form"
 end

 def static
	render :action => "admin-statistics"
 end

 
end

