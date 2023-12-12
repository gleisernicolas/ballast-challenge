Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  devise_for :librarians, controllers: {
    sessions: 'librarians/sessions',
    registrations: 'librarians/registrations'
  }

  namespace :librarians do
    resources :books, only: [:index, :create, :update, :destroy, :show]
    resources :loans, only: [:index, :show]

    put '/loans/:id/return', to: 'loans#return'
    get '/dashboard', to: 'dashboard#show'
  end

  namespace :members do
    get '/available_books', to: 'books#available_books'
    resources :books, only: [:index, :show]
    resources :loans, only: [:index, :create, :show]
    get '/dashboard', to: 'dashboard#show'
  end
end
