Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :doctors, only: [:show, :index, :create, :update, :edit, :destroy] do
    get 'send_password', to: 'doctors#send_password', on: :collection
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/services'
  get 'welcome/works'

  get 'companies/index'
  get 'company/doctors', to: 'companies#doctors'
  get 'company/schedule', to: 'companies#schedule'
  get 'company/:id', to: 'companies#show', as: 'company'

  root 'welcome#index'

  get 'doc', to: 'doctors#login'
  match 'doc/login', to: 'doctors#create_session', via: [:put, :patch, :get]
  match 'doc/logout', to: 'doctors#logout', via: [:put, :patch, :get]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
