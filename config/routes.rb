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
    resources :books, only: [:index, :create, :update, :destroy]
  end
end
