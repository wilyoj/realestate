Rails.application.routes.draw do
  resources :locations, :estates, :houses
  devise_for :users
  root 'common_pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
