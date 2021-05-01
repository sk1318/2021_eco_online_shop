Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "public/homes#top"
   get "admin"=>"admin/homes#top",as: "admin_top"
   
   
  namespace :admin do
   resources :items
   resources :customers
   resources :genres
  end
   devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'   
   } 
  
  
  scope module: :public do
    devise_for :customers
    get "customers/mypage"=> "customers#show",as: "mypage"
    patch "costomers/withdraw"=>"customers#withdraw",as: "withdraw"    
    get "customers/cancellation"=>"customers#cancellation",as: "cancellation"
    resources :customers
    resources :items
    delete "cart_items/destroy_all"=>"cart_items#destroy_all",as: "destroy_all"
    resources :cart_items
    resources :orders
  end
end