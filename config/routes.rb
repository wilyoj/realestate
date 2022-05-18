Rails.application.routes.draw do
  get 'locations/index'
  get 'locations/new'
  get 'locations/create'
  get 'locations/edit'
  get 'locations/update'
  get 'locations/destroy'
  root 'common_pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
