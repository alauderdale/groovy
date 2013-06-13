Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'shots#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  devise_for :shots
  resources :shots do
    resources :comments
  end
  match ':controller(/:action(/:id))(.:format)'
end