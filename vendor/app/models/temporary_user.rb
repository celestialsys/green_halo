class TemporaryUser < ActiveRecord::Base
def  self.add(email,pass,name,lname,pos,com,web,addr,addr2,zip,phone)
 temporary_user=TemporaryUser.new(:email => email,:password => pass,:first_name => name,:last_name => lname,:company_name => com ,:address => addr,:zip =>  zip,:phone => phone)
 temporary_user.save
end
end
