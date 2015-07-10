class AdminsController < ApplicationController
	#before_filter :authenticate_user!
  #before_action :authenticate_temporary_user!
 # def resource_name
 #    :temporary_user
 #  end

 #  def resource
 #    @resource ||= TemporaryUser.new
 #  end

 #  def devise_mapping
 #    @devise_mapping ||= Devise.mappings[:emporary_user]
 #  end

 def dashboard
 	render :action => 'dashboard'
 end

def confirm
end



def terms
	
end

def policies
end

def addc
@temps = TemporaryUser.add(params["email"],params["pass"],params["name"],params["lname"],params["pos"],params["com"],params["web"],params["addr"],params["addr2"],params["zip"],params["phone"])
end

def confirm_user
	@temporary_user = TemporaryUser.where(:id => params[:id]).first
	#render :text =>params.inspect and return false
	render 'confirm_user'
end

def id
# ascac 
end


def account_confirmed
	
end

def form
	render "admins/form"
end

def auth
 @admins = TemporaryUser.search(params["user"],params["pass"])
# @auths = 2
# @auths= Auth.all
end

def hover
	render :action => "hover"
end

def static
	render :action => "admin-statistics"
end

def show 
end

def create
end

def edit
end
def new
end
def index
end 
end
