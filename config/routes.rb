AtWork::Application.routes.draw do
  resources :users
  resources :users do
    resources :accomplishments
  end
  match '/login/create' => 'login#create', as: :login
  match '/login' => 'login#new', as: :login
  match '/logout' => 'login#destroy', as: :logout
  match '/' => 'application#index'
  match '/refresh_everyone' => 'application#refresh_everyone'
  match '/refresh_timeline' => 'application#refresh_timeline'
end
