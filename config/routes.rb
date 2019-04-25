Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
 :registrations => 'admin_users/registrations',
 :sessions => 'admin_users/sessions'
}

  resources :users
  resources :blogs

  root "users#top"


	get "camera/:kana" => "prefectures#camera"
	get "basketball/:kana" => "prefectures#basketball"

	get "camera" => "prefectures#camera_top"
	get "basketball" => "prefectures#basketball_top"

	get ":kana" => "prefectures#prefecture_top"

	get "blogs" => "blogs#index"

	get "login" => "users#login_form"
	post "login" => "users#login"
	post "logout" => "users#logout"
    

end
