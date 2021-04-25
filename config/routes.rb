Rails.application.routes.draw do
  root to: "public/homes#top"
  
  get "customers/mypage"=> "public/customers#show",as: "mypage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   get "admin"=>"admin/homes#top",as: "admin_top"
   devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'   
  } 
  
  scope module: :public do
   devise_for :customers
  end
end