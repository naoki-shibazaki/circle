Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
    :registrations => 'admin_users/registrations',
    :sessions => 'admin_users/sessions'
  }

  devise_for :members, :controllers => {
    :registrations => 'members/registrations',
    :sessions => 'members/sessions'
  }

  resources :categories, only: [] do
    resources :events, only: :index
  end

	resources :users do
		resources :blogs, except: [:index]
		resources :matches, only: [:new, :create]
		resources :links, only: [:new, :create]
    resources :schedules
    resources :questions
    resources :reviews
		resources :opinions, only: [:new, :create, :index]
		resources :user_contacts, only: [:new, :create, :index]
    resource :bookmarks, only: [:create, :destroy]
      collection do
        get 'search'
      end
  end

  resources :members
	resources :matches, except: [:new, :create]
	resources :links, except: [:new, :create, :show]
  resources :invalid_emails, only: [:index, :create, :destroy]



	resources :prefectures, only: [] do
    resources :cities, only: :index
  end

	scope '/contents' do
    resources :differences
	end

	scope '/coat' do
		resources :places, except: [:index, :show]
	end

	root 'users#top'

	get '/sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/circlebook/sitemaps/sitemap.xml.gz')

	get 'faq' , to: 'users#faq'
	get 'rules' , to: 'users#rules'
	get 'privacypolicy' , to: 'users#privacypolicy'
	get 'line' , to: 'users#line'
	get 'login' , to: 'users#login'
	get 'admin_users' , to: 'users#admin_users'
	get 'webmaster' , to: 'users#webmaster'
	# get 'questions' , to: 'questions#questions'
	# get 'collections' , to: 'collections#collections'
	get 'event_questions' , to: 'event_questions#event_questions'
  get 'contents' , to: 'differences#contents'
  get 'reviews' , to: 'reviews#all_reviews'

	# 旧ブログ用のリダイレクト
	get 'blogs/:id', to: 'blogs#show_redirect'

	get 'user/add', to: 'users#add'
	get 'users/:id/edit2', to: 'users#edit2'
	patch 'users/:id/edit2', to: 'users#update2'
	get 'users/:id/mypage' , to: 'users#mypage'
	patch 'users/:id/mypage', to: 'users#update_contact'
	get 'users/:id/contact' , to: 'user_contacts#contact'
	get 'users/:id/thanks' , to: 'user_contacts#thanks'

  # サンプルの質問
	get 'users/:user_id/question' , to: 'questions#question'
	get 'users/:user_id/blogs' , to: 'blogs#user_blogs'
  get 'users/:user_id/gallery' , to: 'blogs#gallery'


	# get 'users/:user_id/collection-sample' , to: 'collections#sample'

	get 'prefectures' , to: 'users#prefecture_index'
	get 'prefectures/:kana' , to: 'users#prefecture'
	get 'prefectures/:kana/tag/:id' , to: 'tags#prefecture'
	get 'prefectures/:kana/:city_kana' , to: 'users#prefecture_city'
	get 'prefectures/:kana/:city_kana/:id' , to: 'users#prefecture_city_station'
	get 'prefectures/:kana/:city_kana/tag/:id' , to: 'tags#prefecture_city'

	get 'blog' , to: 'blogs#index'
	get 'blog/prefectures' , to: 'blogs#prefecture_index'
	get 'blog/prefectures/:kana' , to: 'blogs#prefecture'
	get 'blog/:ruby' , to: 'blogs#event'
	get 'blog/:ruby/:kana' , to: 'blogs#event_prefecture'

	get 'places' , to: 'places#index'
	get 'places/count' , to: 'places#count'
	get 'places/all/:kana/:city_kana/:id' , to: 'places#show_noindex'
	get 'places/:ruby' , to: 'places#event'
	get 'places/:ruby/:kana' , to: 'places#prefecture'
	get 'places/:ruby/:kana/:city_kana' , to: 'places#city'
	get 'places/:ruby/:kana/:city_kana/:id' , to: 'places#show'

	get	'matches/:id/contact' , to: 'matches#contact'
	get 'match' , to: 'matches#match'
	get 'match/prefectures/:kana' , to: 'matches#prefecture'
	get 'match/:ruby' , to: 'matches#event'
	get 'match/:ruby/:kana' , to: 'matches#event_prefecture'

	get 'link/:unique_id', to: 'links#link'


	get ':ruby' , to: 'users#event'
	get ':ruby/qa' , to: 'event_questions#index'
	post ':ruby/qa' , to: 'event_questions#create'
	get ':ruby/qa/:id' , to: 'event_questions#show'
	post ':ruby/qa/:id' , to: 'event_answers#create'
	delete ':ruby/qa/:id' , to: 'event_questions#delete'
	delete ':ruby/qa/:event_question_id/:id' , to: 'event_answers#delete'

	get ':ruby/tag/:id' , to: 'tags#event'
	get ':ruby/:kana' , to: 'users#event_prefecture'
	get ':ruby/:kana/tag/:id' , to: 'tags#event_prefecture'
	get ':ruby/:kana/:city_kana' , to: 'users#event_prefecture_city'
	get ':ruby/:kana/:city_kana/:id' , to: 'users#event_prefecture_city_station'
	get ':ruby/:kana/:city_kana/tag/:id' , to: 'tags#event_prefecture_city'


end
