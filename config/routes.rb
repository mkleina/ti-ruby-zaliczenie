Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts
  resources :clinics

  get 'home/index'
  get 'search/' => 'searches#index'
  get 'search/query' => 'searches#query'
  get 'clinic_search/' => 'clinic_searches#index'
  get 'clinic_search/query' => 'clinic_searches#query'
  root 'home#index'
end
