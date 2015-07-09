class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  #before_filter :authenticate_temporary_user!
  #helper_method :resource, :resource_name, :devise_mapping




  


  # def resource_name
  #   :temporary_user
  # end

  # def resource
  #   @resource ||= TemporaryUser.new
  # end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:temporary_user]
  # end

  def after_sign_up_path_for(resource)
    #   # signed_in_root_path(resource)
    redirect_to 'admins/confirm_user'
    #   root_path

   end

   def after_sign_in_path_for(resource)
     request.env['omniauth.origin'] || stored_location_for(resource) || authenticated_root_path
   end



protected

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:encrypted_password, :confirm_email,:first_name,:last_name, :position,:company_name,:address1, :address2, :phone,:to_know,:type_of_plan,:reset_password_token,:reset_password_sent_at,:remember_created_at, :sign_in_count, :current_sign_in_at,:last_sign_in_at, :current_sign_in_ip,:last_sign_in_ip ,:confirmation_token,:confirmed_at,:confirmation_sent_at,:unconfirmed_email,:password,:password_confirmation)}
end


end
