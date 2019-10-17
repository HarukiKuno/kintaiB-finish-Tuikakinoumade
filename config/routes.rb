Rails.application.routes.draw do
  get 'bases/index'

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
  
  
  #拠点
  
  get 'bases', to: 'bases#index'
  get 'edit_base_info', to: 'bases#edit_base_info'
  get '/new', to: 'bases#new'
  post '/new', to: 'bases#create'
  delete '/destroy', to: 'bases#destroy'
  patch 'bases/update_base_info'
  
  resources :users do
    collection { post :import }
    
    resources :attendances, only: :create
  end
end