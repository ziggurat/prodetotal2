Prodetotal2::Application.routes.draw do

  root 'application#serve_ember_app'

  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      # Users
      get 'users/:user_id' => 'users#show'

      # Competitions
      get 'competitions' => 'competitions#index' # ?old=true
      get 'competitions/:competition_id' => 'competitions#show'
      post 'competitions' => 'competitions#create'
      put 'competitions/:competition_id' => 'competitions#update'
      # get 'search/competitions/:term'


      # Teams
      get 'teams' => 'teams#index'
      get 'teams/:team_id' => 'teams#show'
      post 'teams' => 'teams#create'
      put 'teams/:team_id' => 'teams#update'
      delete 'teams/:team_id' => 'teams#destroy'

      # Matches
      get 'competitions/:competition_id/matches' => 'matches#matches_for_competition'
      post 'matches' => 'matches#create'
      post 'matches/set_score' => 'matches#set_score'

      # Forecasts
      # post 'forecasts'
      # get 'competitions/:competition_id/forecasts'
      # get 'users/user_id/competitions/:competition_id/forecasts'

      # Challenges
      # post 'challenges'
      # get 'challenges/:challenge_id'
      # get 'challenges/:challenge_id/ranking'
      # get 'search/challenges/:term'
      # post 'challenges/add_user'

    end
  end

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
