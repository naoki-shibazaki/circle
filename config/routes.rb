Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
 :registrations => 'admin_users/registrations',
 :sessions => 'admin_users/sessions'
}

  resources :users
  resources :blogs

  root "users#top"

  get 'sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/circlebook/sitemaps/sitemap.xml.gz')


	get "events/:ruby" => "users#event"
	get "prefectures/:kana" => "users#prefecture"
	get ":ruby/:kana" => "users#event_prefecture"
	get ":ruby/:kana/:decade" => "users#age"

	get "blogs" => "blogs#index"
	get "events" => "users#event_index"
	get "prefectures" => "users#prefecture_index"

	get "line" => "users#line"

	get "login" => "users#login_form"
	post "login" => "users#login"
	post "logout" => "users#logout"

end
