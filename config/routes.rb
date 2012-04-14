YentaFriend::Application.routes.draw do
  


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admins
  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  match '/fb_handler/request_callback' => 'fb_handler#request_callback', :as => 'fb_callback'

  resources :profiles do
    member do
      post 'invite'
    end
  end
  
  
  match 'create_match' => 'profiles#create_match'
  
  match "project" => 'static_pages#project'
  match "team" => 'static_pages#team'
  match "login" => 'static_pages#login'
  
  match 'dashboard' => 'yenta_friend#dashboard'
  match 'browse' => 'yenta_friend#browse'
  match 'connections' => 'yenta_friend#connections'
  match 'chickstud_connections(/:id)' => 'yenta_friend#chickstud_connections', :as => :chickstud_connections
  match 'inbox' => 'yenta_friend#inbox'
  match 'stable' => 'yenta_friend#stable'
  
  
  
  
  root :to => 'static_pages#login'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
