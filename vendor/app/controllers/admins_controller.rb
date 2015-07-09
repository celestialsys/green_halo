class AdminsController < ApplicationController

def confirm
end
def terms
end
def policies
end
def addc
@temps = TemporaryUser.add(params["email"],params["pass"],params["name"],params["lname"],params["pos"],params["com"],params["web"],params["addr"],params["addr2"],params["zip"],params["phone"])
end
def id
# ascac 
end
def form
end
def auth
 @admins = Admin.search(params["user"],params["pass"])
# @auths = 2
# @auths= Auth.all
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
