Rails.application.routes.draw do
  
  # 1. Routes untuk Movies
  resources :movies do
    member do
      patch 'vote'
      patch 'toggle_watchlist'
    end
    
    # TAMBAHKAN BARIS INI:
    # Ini membuat route untuk kirim review (POST) dan lihat review (GET)
    resources :reviews, only: [:index, :create]
  end

  # 2. Routes untuk User & Auth
  post '/users', to: 'users#create'
  post '/login', to: 'sessions#create'


  get '/admin/dashboard', to: 'admin#stats'
end