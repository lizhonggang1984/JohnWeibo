Rails.application.routes.draw do


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :admins do
    collection do
      get 'index'
      get 'allcontent'
    end	
  end

  resources :posts do
    collection do
      get 'recent'
      get 'showpost'
      get 'allcontent'
      get 'admin'
    end	
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

end
