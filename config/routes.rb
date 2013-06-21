Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'shots#index'
  end
  get 'tags/:tag', to: 'shots#index', as: :tag
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :shots
  end
  devise_for :shots
  resources :shots do
    resources :comments
  end
  match ':controller(/:action(/:id))(.:format)'
end