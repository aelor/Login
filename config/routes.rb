Login::Application.routes.draw do
  
  get "tasks/index"
  get "tasks/show"
  get "tasks/new"
  get "tasks/edit"
  resources :clients do
   resources :projects do
    resources :tasks
    end
  end

  get "pages/home"
  get "pages/determinetask"
  match "pages/determinetask", to: 'qanotes#new', via: 'post'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "sessions#new"
  resources :users do
    
    get :add_admin_role, :on =>:member
    put :add_admin_role, :on =>:member
    get :remove_admin_role, :on => :member
    put :remove_admin_role, :on => :member
     get :add_rm_role, :on =>:member
    put :add_rm_role, :on =>:member
    get :remove_rm_role, :on => :member
    put :remove_rm_role, :on => :member
     get :add_quality_role, :on =>:member
    put :add_quality_role, :on =>:member
    get :remove_quality_role, :on => :member
    put :remove_quality_role, :on => :member
  end
  resources :sessions
  resources :qanotes
  resources :password_resets
 # get "projects/submit_client"
  #put "projects/submit_client"
  post "projects/submit_client"
  post "qanotes/submit_server"
 # match "projects/submit_client", to: 'projects#submit_client', via: 'post'

  #get "say/hello"
 # get "say/goodbye"
  #get "say/filenames"
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
