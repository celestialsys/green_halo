class TemporaryUsers::RegistrationsController < Devise::RegistrationsController
 #before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
     # def new
     #  super
      
     # end

  # POST /resource
    def create
       #render :text =>params.inspect and return false
   #   @temp_user  = TemporaryUser.new(temporary_user_params)
   #    if @temp_user.save
   #       redirect_to  admins_confirm_user_path(temporary_user_params)
   #    else
   #      render 'new'
   #    end
   #   # super do |user|
   #   #   redirect_to  admins_confirm_user_path(params)
   #   # end
   #   # @temp_user = TemporaryUser.new(temporary_user_params)
   #   # if @temp_user.save
   #   #   redirect_to 'admins/confirm_user'
   #   #  else
   #   #    render :action => 'new'
   #   #  end
    end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
   # def configure_sign_up_params
   # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

   private
     def temporary_user_params
       params.require(:temporary_user).permit(:email, :password,:password_confirmation,:first_name,:last_name,:position,:company_name,:website,:address1,:address2,:zipcode,:phone,:to_know,:type_of_plan)
     end

  protected
    # def after_sign_up_path_for(resource)
    #   # signed_in_root_path(resource)
    #   #redirect_to 'admins/confirm_user'
    #   root_path

    # end



    def after_sign_up_path_for(resource)
      p 111111111111111111
      # signed_in_root_path(resource)
      #redirect_to 'admins/confirm_user'
      # root_path

    end

    def after_inactive_sign_up_path_for(resource)
       "/admins/confirm_user?id=#{resource.id}"
     end


    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
end
