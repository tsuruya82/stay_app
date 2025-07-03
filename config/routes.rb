Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/profiles_edit', to: 'users/registrations#profiles_edit'
    patch 'users/profiles_update', to: 'users/registrations#profiles_update'
  end

  get "users/show", to: "users#show"
  get 'profiles/show', to: "profiles#show"

  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
