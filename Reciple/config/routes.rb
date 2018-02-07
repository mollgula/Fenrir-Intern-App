Rails.application.routes.draw do
  get 'searchs/sear'
  get 'searchs/resu'
  get 'searchs/HowToUse', to: 'searchs#HowToUse'
  get 'searchs/contact', to: 'searchs#contact'
  get 'searchs/words', to: 'searchs#words'
  get 'searchs/favorite', to: 'searchs#favorite'
  get 'searchs/search', to: 'searchs#search'
  post 'searchs/search', to: 'searchs#search'
  post 'searchs/join', to: 'searchs#join'
  get 'searchs/joinSearch', to: 'searchs#joinSearch'
  get 'sessions/new'
  root 'users#home'
  get 'users/new'
  get 'signup' => 'users#new'
  resources :users
  #get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # blockの最後に以下を追加
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
