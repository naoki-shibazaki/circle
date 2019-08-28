Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
 :registrations => 'admin_users/registrations',
 :sessions => 'admin_users/sessions'
}

  resources :users do
  	resources :schedules, only: [:create, :destroy]
  end

  resources :blogs

	root 'users#top'

	get '/sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/circlebook/sitemaps/sitemap.xml.gz')

	get 'faq' , to: 'users#faq'
	get 'rules' , to: 'users#rules'
	get 'privacypolicy' , to: 'users#privacypolicy'
	get 'line' , to: 'users#line'
	get 'link' , to: 'users#link'

	get 'prefectures' , to: 'users#prefecture_index'
	get 'prefectures/:kana' , to: 'users#prefecture'
	get 'prefectures/:kana/:group' , to: 'users#prefecture_group'
	get 'prefectures/:kana/:group/:decade' , to: 'users#prefecture_age'


	get 'blog' , to: 'blogs#top'

	get 'blog/prefectures' , to: 'blogs#prefecture_index'
	get 'blog/prefectures/:kana' , to: 'blogs#prefecture'

	get 'blog/:ruby' , to: 'blogs#event'
	get 'blog/:ruby/:kana' , to: 'blogs#event_prefecture'

	
	get ':ruby' , to: 'users#event'
	get ':ruby/:kana' , to: 'users#event_prefecture'

	# get ':ruby/:kana/group/:group' , to: 'users#group'

	get ':ruby/:kana/beginner' , to: 'users#group_beginner'
	get ':ruby/:kana/expert' , to: 'users#group_expert'
	get ':ruby/:kana/student' , to: 'users#group_student'
	get ':ruby/:kana/worker' , to: 'users#group_worker'	

	get ':ruby/:kana/:decade' , to: 'users#age'


end
