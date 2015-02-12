Rails.application.routes.draw do
  root :to => 'quotes#index'

  devise_for :users
  resources :quotes
  resources :sections
  resources :items
  resources :item_templates

  get "client_select" => "quotes#client_select"
  get "send_to_xrono" => "quotes#send_to_xrono"
end
