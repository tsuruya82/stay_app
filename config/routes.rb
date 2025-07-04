Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/profiles_edit', to: 'users/registrations#profiles_edit'
    patch 'users/profiles_update', to: 'users/registrations#profiles_update'
  end

  get 'users/show', to: 'users#show'
  get 'profiles/show', to: 'profiles#show'

  resources :rooms

  get 'index', to: 'home#index'
  get 'tokyo_search', to: 'home#tokyo_search'
  get 'osaka_search', to: 'home#osaka_search'
  get 'kyoto_search', to: 'home#kyoto_search'
  get 'sapporo_search', to: 'home#sapporo_search'
  
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
