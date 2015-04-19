PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/sort', to: 'posts#sort'

  resources :posts do
    member do
      post 'vote'
    end

  	resources :comments do
      member do
        post 'vote'
      end

    end

  end

  resources :categories
  resources :users
    
end
