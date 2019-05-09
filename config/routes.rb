Rails.application.routes.draw do

  resources :informativo_obras
  resources :statusobras
  resources :avisos
  resources :departments
  resources :statuses
  resources :categories
  resources :buildings
  resources :permitidos
  resources :perfils
  resources :logs
  resources :usuarios
  resources :requests

  get 'desativacat/:id' => 'categories#desativacat', as: 'desativacat'
  get 'desativadep/:id' => 'departments#desativadep', as: 'desativadep'
  get 'desativasta/:id' => 'statuses#desativasta', as: 'desativasta'
  get 'desativab/:id' => 'buildings#desativab', as: 'desativab'
  get 'desativastaobra/:id' => 'statusobras#desativastaobra',  as: 'desativastaobra'

  get 'reqfinalizar/:id' => 'requests#reqfinalizar', as: 'reqfinalizar'

  get 'resultindex' => 'requests#resultindex', as: 'resultindex'

  get 'buscafin' => 'requests#buscafin', as: 'buscafin'

  get 'welcome/login'
  get 'welcome/callback'
  get 'logout' => 'welcome#destroy', as: 'logout'

  root 'welcome#login'

  get 'relstatus' => 'requests#relstatus', as: 'relstatus'
  get 'relstatuspredio' => 'requests#relstatuspredio', as: 'relstatuspredio'
  get 'relpredio' => 'requests#relpredio', as: 'relpredio'
  get 'reldepto' => 'requests#reldepto', as: 'reldepto'
  get 'relstatusdepto' => 'requests#relstatusdepto', as: 'relstatusdepto'
  get 'relfin' => 'requests#relfin', as: 'relfin'

  get 'enviarfin/:id' => 'requests#enviarfin', as: 'enviarfin'
  get 'pedidocomprado/:id' => 'requests#pedidocomprado', as: 'pedidocomprado'
  get 'materialdisp/:id' => 'requests#materialdisp', as: 'materialdisp'

  get 'enviaranalise/:id' => 'informativo_obras#enviaranalise', as: 'enviaranalise'
  get 'concluida/:id' => 'informativo_obras#concluida', as: 'concluida'

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
