Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login',
                    sign_out: 'logout', sign_up: 'register'}

  resources :contacts, only: [:new, :create]
  resources :topics, only: [:index, :show]

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'
  root to: 'pages#home'
  get 'angular-items', to: 'portfolio#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get '/about-me', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  post '/contact', to: 'contacts#create', as: 'contacts_create'
end
