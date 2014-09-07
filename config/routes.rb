Rails.application.routes.draw do
 
  devise_for :users, :path_prefix => 'account' #, skip: [:registrations] #, controllers: {sessions: "users_sessions"}
  
  #:path changes /users to /accounts
  #:as changes new_user_path to new_account_path
  #resources :users, path: 'account', as: 'account'
  resources :users
  resources :messages

  resources :conversations do
    member do
      post :trash
      post :reply
    end
  end

  resources :tutor_profiles
  resources :enquiries
  resources :tutorships  do
    collection do
      post :invite_to_tutorship, as: 'invite'
      post :accept_tutorship, as:  'accept'
      get :tutorpage
      get :studentpage
    end
  end


  root to: "conversations#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
