Rails.application.routes.draw do
  root :to => 'users#index'
  

  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  resources :sessions

  get 'users/findcontacts' => 'users#findcontacts', :as => 'findcontacts'
  resources :users
  

  post 'friendships/accept/:id' => 'friendships#accept'
  post 'friendships/reject/:id' => 'friendships#reject'
  resources :friendships

  get 'boards/index' => 'boards#index', :as => 'active_boards'
  resources :boards

  get 'boardlists/accept/:id' => 'boardlists#accept'
  get 'boardlists/reject/:id' => 'boardlists#reject'
  resources :boardlists do
  	collection {post :sort}
  end

  resources :lists

  post 'shoppingitems/edit_listitems/:id' => 'shoppingitems#edit_listitems'
  post 'shoppingitems/new/:id' => 'shoppingitems#new'
  resources :shoppingitems

  post 'taskitems/edit_listitems/:id' => 'taskitems#edit_listitems'
  post 'taskitems/new/:id' => 'taskitems#new'
  patch 'taskitems/volunteer/:id' => 'taskitems#volunteer'
  resources :taskitems


  
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
