Rails.application.routes.draw do
  post 'users' => 'users#create'
  post 'sessions/create' => 'sessions#create'

  namespace :api do
    get 'random-quote' => 'quotes#random_quote'
    namespace :protected do
      get 'random-quote' => 'quotes#random_quote'
    end
  end
end
