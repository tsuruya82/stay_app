Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/account', to: 'users/registrations#account'
    get 'users/profiles', to: 'users/registrations#profiles'
    get 'users/profile_edit', to: 'users/registrations#profile_edit'
    patch 'users/profile_update', to: 'users/registrations#profile_update'
  end

  resources :rooms

  resources :reservations

  get 'index', to: 'homes#index'
  get 'tokyo_search', to: 'homes#tokyo_search'
  get 'osaka_search', to: 'homes#osaka_search'
  get 'kyoto_search', to: 'homes#kyoto_search'
  get 'sapporo_search', to: 'homes#sapporo_search'
  
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
