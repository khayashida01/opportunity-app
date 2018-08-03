Rails.application.routes.draw do
  get 'map/index'

  resources :geousers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  root 'welcome#index'
  post 'update_current_location' => "welcome#update_current_location"
  
  resources :employees
  get 'search_employees' => 'employees#search'
  
  resources :customers
  get 'search_customers' => 'customers#search'
  get 'customer_search' => 'customers#customer_search'
  
  resources :opportunities
  get 'search_opportunities' => 'opportunities#search'
  
  resources :activities
  get 'search_activities' => 'activities#search'
  post 'activities/:id/checkin' => 'activities#checkin', as: 'checkin_activities'
  get 'activities/:id/checkout' => 'activities#checkout', as: 'checkout_activities'
  patch 'activities/:id/checkout' => 'activities#checkout_update', as: 'checkout_update_activities'

  #get 'welcome_test' => 'welcome#test'
  get 'welcome_today_activities' => 'welcome#today_activities'
  get 'welcome_this_week_activities' => 'welcome#this_week_activities'
  get 'welcome_this_month_activities' => 'welcome#this_month_activities'
  get 'welcome_today_activities_for_manager' => 'welcome#today_activities_for_manager'
  get 'welcome_this_week_activities_for_manager' => 'welcome#this_week_activities_for_manager'
  get 'welcome_this_month_activities_for_manager' => 'welcome#this_month_activities_for_manager'

  resources :quotations
  get 'search_quotations' => 'quotations#search'
  
  resources :quotation_comments

  resources :calendar

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
