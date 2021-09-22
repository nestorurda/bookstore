Rails.application.routes.draw do
  resources :requests
  root "books#index"
  get 'books/index'
  post "books/reserve/:id", to: 'books#reserve', as: 'reserve'
  get "books/reserves", to:'books#myreserve', as:'myreserve'
  delete 'books/reserves/:id', to:'books#destroy', as:'reserve_destroy'
  get "books/buy", to:'books#buy', as:'buy'
  get "books/buye", to:'books#buye', as:'buye'
  post "books/buy", to:'books#buyed', as:'buy_yet'
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
