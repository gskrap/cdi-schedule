Rails.application.routes.draw do
  resources :users do
    get 'make_admin'        => 'users#make_admin'
    get 'remove_admin'      => 'users#remove_admin'
    get 'make_work_study'   => 'users#make_work_study'
    get 'remove_work_study' => 'users#remove_work_study'
  end
  resources :locations
  resources :dance_classes do
    get 'headshots'     => 'headshots#show'
  end
  resources :teachers do
    get 'dance_classes' => 'teachers#classes'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post    'students'      => 'students#post'
  delete  'students'      => 'students#delete'
  put     'students/:id'  => 'students#update'
  get     'admin'         => 'admin#show'
  get     'admin/help'    => 'admin#help'

  get     'hours'         => 'teachers#hours'
  get     'pickups'       => 'teachers#pickups'

  get     'headshots'     => 'headshots#index'
  put     'headshots/:id' => 'headshots#update'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :groups, only: [:show, :edit] do
    get 'schedule' => 'groups#schedule'
  end

  get    'sessions/login'   => 'sessions#new'
  post   'sessions'         => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'

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
