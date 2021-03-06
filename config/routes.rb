Portfolio::Application.routes.draw do

  root :to => "welcome#index"

  get  "dropbox/main"
  post "dropbox/upload"
  get  "dropbox/auth_start"
  get  "dropbox/auth_finish"

  namespace :admin do
    resources :images do
      collection do
        post 'upload'
      end
    end
  end

  match '/personal_information', to: 'personal_information#index'
  match '/update_personal_information', to: 'personal_information#update', via: :put
  match '/edit_personal_information',  to: 'personal_information#edit'
  match '/create_personal_information',  to: 'personal_information#create', via: :post
  match '/new_personal_information',   to: 'personal_information#new'
#personal_information_index GET    /personal_information(.:format)          personal_information#index
 #                          POST   /personal_information(.:format)          personal_information#create
  
 #edit_personal_information GET    /personal_information/:id/edit(.:format) personal_information#edit
 #     personal_information GET    /personal_information/:id(.:format)      personal_information#show
 #                          PUT    /personal_information/:id(.:format)      personal_information#update
 #                          DELETE /personal_information/:id(.:format)      personal_information#destroy

  resources :personal_details, only: [:index, :new, :create, :edit, :update]
  resources :dispatches, only: [:new, :create]
  resources :resources, only: [:show]
  resources :contact_profiles
  #resources :skills, only: [:show]
  resources :skillsets
  resources :sectors
  resources :projects do
    collection do
      post 'upload'
    end
  end
  resources :users, only: [:show, :new, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/home', to: 'static_pages#home'
  match '/contact', to: 'static_pages#contact'
  match '/parallax', to: 'static_pages#parallax'
  match '/parallax2', to: 'static_pages#parallax2'
  match '/contactme', to: 'dispatches#new'
  
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
