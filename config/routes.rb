Rails.application.routes.draw do
  resources :records
  mount ReactiveRecord::Engine => '/rr' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
