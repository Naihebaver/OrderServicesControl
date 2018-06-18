Rails.application.routes.draw do
  devise_for :users
 
  get 'pages/search_order'
  post 'pages/order_status'
  

  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
