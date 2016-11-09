Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts

  get 'home/index'
  get 'search/' => 'searches#index'
  get 'search/query' => 'searches#query'
  root 'home#index'
end
