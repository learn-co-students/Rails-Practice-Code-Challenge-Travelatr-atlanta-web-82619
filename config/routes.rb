Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :new, :edit]
  resources :destinations, only: [:index, :show]
  resources :posts, except: [:destroy] do
    get :add_like
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
