DnTaxi::Application.routes.draw do

  devise_for :taxis
  devise_for :users
  resources :orders
  resources :places
  resources :feedbacks
  resources :users
  resources :cities
  resources :streets
  get "/about", to: 'static_pages#about'
  get "/partners", to: 'static_pages#partners'

  scope 'taxi_panel', :module => :taxi_panel do
    get "/" => redirect("/taxi_panel/booked_orders")
    resources :booked_orders, only: [:index, :update]
    resources :taxis, only: [:show, :edit, :update]
    get '/old_orders', to: 'booked_orders#old_orders'
    resources :drivers
  end

  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  root 'orders#new'
end
