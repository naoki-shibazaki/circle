Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
 :registrations => 'admin_users/registrations',
 :sessions => 'admin_users/sessions'
}

	resources :users do
  		resources :schedules
  		resources :questions
  	end

	resources :blogs
	resources :places, except: :show

	resources :prefectures, only: [] do
    	resources :cities, only: :index
  	end
 
	root 'users#top'

	get '/sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/circlebook/sitemaps/sitemap.xml.gz')

	get 'faq' , to: 'users#faq'
	get 'rules' , to: 'users#rules'
	get 'privacypolicy' , to: 'users#privacypolicy'
	get 'line' , to: 'users#line'
	get 'link' , to: 'users#link'
	get 'admin_users' , to: 'users#admin_users'	
	
	get 'contact/:id', to: 'users#contact'
	get 'users/:user_id/question' , to: 'questions#question'

	get 'prefectures' , to: 'users#prefecture_index'
	get 'prefectures/:kana' , to: 'users#prefecture'
	get 'prefectures/:kana/:group' , to: 'users#prefecture_group'
	get 'prefectures/:kana/:group/:decade' , to: 'users#prefecture_age'

	get 'blog' , to: 'blogs#top'

	get 'blog/prefectures' , to: 'blogs#prefecture_index'
	get 'blog/prefectures/:kana' , to: 'blogs#prefecture'

	get 'blog/:ruby' , to: 'blogs#event'
	get 'blog/:ruby/:kana' , to: 'blogs#event_prefecture'

	get 'places/count' , to: 'places#count'
	get 'places/:ruby' , to: 'places#event'
	get 'places/:ruby/:kana' , to: 'places#prefecture'
	get 'places/:ruby/:kana/:city_kana' , to: 'places#city'
	get 'places/:ruby/:kana/:city_kana/:id' , to: 'places#show'

	# post "likes/:post_id/create" => "likes#create"	

	get ':ruby' , to: 'users#event'
	get ':ruby/:kana' , to: 'users#event_prefecture'

	# get ':ruby/:kana/group/:group' , to: 'users#group'

	get ':ruby/:kana/beginner' , to: 'users#group_beginner'
	get ':ruby/:kana/expert' , to: 'users#group_expert'
	get ':ruby/:kana/student' , to: 'users#group_student'
	get ':ruby/:kana/worker' , to: 'users#group_worker'	

	get ':ruby/:kana/:decade' , to: 'users#age'


end
