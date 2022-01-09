Rails.application.routes.draw do
  resources :tasks do
    get 'root', on: :collection
  end
  resources :scheduled_tasks do
    get 'active', on: :collection
  end
  resources :todoitems

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end