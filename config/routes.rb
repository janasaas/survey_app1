SurveyApp1::Application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}, :defaults => {:format => "json"}) do
    get 'surveys/:id/' => 'surveys#show'
    get 'surveys/' => 'surveys#list'
    post 'surveys/:id' => 'surveys#update_response'
  end
  devise_for :users
  root :to => 'surveys#list'
  resources :surveys, only: [:list, :new, :create, :show, :edit, :update, :destroy]
  get '/surveys/:id/result' => 'surveys#result', as: :result_survey  
  get '/settings/' => 'home#settings'
  get '/help' => 'home#help'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  resources :agents, only: [:new, :create]
  resources :surveyees, only: [:new, :create]
  resources :responses, only: [:new, :create]

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
