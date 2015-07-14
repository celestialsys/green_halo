Rails.application.routes.draw do
devise_for :temporary_users , :controllers => { :registrations =>  'temporary_users/registrations',:confirmations =>  'temporary_users/confirmations'}


devise_scope :temporary_user do

  
  authenticated do
    get 'admins/dashboard' => "admins/dashboard", as: :authenticated_root
  end

   unauthenticated do
     root 'devise/sessions#new', as: :unauthenticated_root
   end
end

 get 'admins/form'
 get 'admins/confirm_user' => 'admins#confirm_user'
 get 'admins/account_confirmed' => 'admins#account_confirmed'
 get '/success_confirmation' => 'admins#successful_confirmation'

 


 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #root 'admins#dashboard'

  # You can have the root of your site routed with "root"
   root 'devise/sessions#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
