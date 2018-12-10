Rails.application.routes.draw do
  # Devise
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  # Root
  root 'notes#index'

  # Resources
  resources :notes

  # Custom routes
  post 'notes/search', to: 'notes#search', as: 'search_note'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
