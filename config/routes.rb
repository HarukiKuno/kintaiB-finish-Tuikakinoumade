Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',   to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  
  get '/edit-basic-info1/:id', to: 'users#syain', as: :syaininfo
  
  
  patch 'update-basic-info',  to: 'users#update_basic_info'
  get 'users/:id/attendances/:date/edit', to: 'attendances#edit', as: :edit_attendances
  patch 'users/:id/attendances/:date/update', to: 'attendances#update', as: :update_attendances
  get 'users/:id/edit_basic_info1', to: 'users#edit_basic_info1', as: :edit_basic_info1_user
  patch 'users/:id/update_basic_info1', to: 'users#update_basic_info1', as: :update_basic_info1_user
  
  
  resources :users do
    collection { post :import }
    
    resources :attendances, only: :create
  end
end