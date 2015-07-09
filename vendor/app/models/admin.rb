class Admin < ActiveRecord::Base
def self.search(sea,pass)
 if sea
       admin=Admin.where(:username => sea,:password => pass).first
end
end
end

