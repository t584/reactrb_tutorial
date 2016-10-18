Rails.application.routes.draw do
  resources :records
  get 'home/avatar'
  get 'home/search_path'
  get 'home/clock'
  get 'home/record'
  mount ReactiveRecord::Engine => '/rr' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
