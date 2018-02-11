Rails.application.routes.draw do
  root to: 'users#home'

  get '/login', to: redirect('/auth/instagram'), as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect { |p, req| req.flash[:error] = 'Instagram Login failed. Please try again!'; '/' }

  resources :sessions, only: [:create, :destroy]
  resources :feeds, only: [:index]
end
