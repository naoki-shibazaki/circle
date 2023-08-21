Rails.application.routes.draw do

  root 'home#index'

  devise_for :admin_users, :controllers => {
    :registrations => 'admin_users/registrations',
    :sessions => 'admin_users/sessions'
  }

  devise_for :members, :controllers => {
    :registrations => 'members/registrations',
    :sessions => 'members/sessions',
    :passwords => 'members/passwords'
  }

  devise_for :exhibition_groups, :controllers => {
    :registrations => 'exhibition_groups/registrations',
    :sessions => 'exhibition_groups/sessions',
    :passwords => 'exhibition_groups/passwords'
  }

  resources :categories, only: [] do
    resources :events, only: :index
  end

  get 'users/kw', to: 'db_keywords#kw'


  # サークル
  scope module: :circles do
    resources :circles, only: [:index, :show]
    scope module: :search do
      resources :events, only: [:index, :show], param: :kana
      resources :prefectures, only: [:index, :show], param: :kana
    end
  end


	resources :users, except: [:show, :index] do
		resources :blogs, except: [:index]
		resources :matches, only: [:new, :create]
		resources :links, only: [:new, :create]
    resources :schedules
    resources :questions
    resources :reviews
		resources :opinions, only: [:new, :create, :index]
		resources :user_contacts
    resource :bookmarks, only: [:create, :destroy]
      collection do
        get 'search'
      end
  end

  resources :members
	resources :matches, except: [:new, :create]
	resources :links, except: [:new, :create, :show]

  # Webmaster
  resources :invalid_emails, only: [:index, :create, :destroy]
  # resources :db_searches, only: [:index]
  resources :db_keywords, except: [:new, :create]
  resources :db_validation_errors, only: [:index]
  resources :account_blocks, only: [:index, :destroy]


	resources :prefectures, only: [] do
    resources :cities, only: :index
  end

	scope '/contents' do
    resources :differences
	end

	get '/sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/circlebook/sitemaps/sitemap.xml.gz')






  # 静的ページ
	get 'faq' , to: 'pages#faq'
	get 'rules' , to: 'pages#rules'
	get 'privacypolicy' , to: 'pages#privacypolicy'
	get 'about' , to: 'pages#about'

	get 'line' , to: 'users#line'
	get 'login' , to: 'users#login'
	get 'admin_users' , to: 'users#admin_users'
	get 'webmaster' , to: 'users#webmaster'
  get 'admin_user_list' , to: 'users#admin_user_list'
	# get 'questions' , to: 'questions#questions'
	# get 'collections' , to: 'collections#collections'
	get 'event_questions' , to: 'event_questions#event_questions'
  get 'contents' , to: 'differences#contents'
  get 'reviews' , to: 'reviews#all_reviews'
  get 'contact_block' , to: 'user_contacts#contact_block'
	get 'user_del' , to: 'users#user_del'
	get 'member_del' , to: 'members#member_del'

	# 旧ブログ用のリダイレクト
	get 'blogs/:id', to: 'blogs#show_redirect'

  # ログインユーザー（出展者）
  scope module: :exhibitor_apps do
    resource :exhibitor_profile, only: [:edit, :update]
    resource :exhibitor_mypage, only: [:show]
  end

  # 出展
  scope module: :exhibitions do
    resources :exhibitors, only: [:show]
    resources :exhibitions do
      resources :exhibition_contacts, only: [:create]
    end
  end


	get 'user/add', to: 'users#add'
  get 'users/kw/:q', to: 'db_keywords#keyword'
	get 'users/:id/edit2', to: 'users#edit2'
	patch 'users/:id/edit2', to: 'users#update2'
	get 'users/:id/edit3', to: 'users#edit3'
	patch 'users/:id/edit3', to: 'users#update3'
  patch 'users/:id/admin_user_update', to: 'users#admin_user_update'
  get 'users/:id/mypage' , to: 'users#mypage'
	patch 'users/:id/mypage', to: 'users#update_contact'
	get 'users/:id/account_del' , to: 'users#account_del'
	get 'users/:id/contact_list' , to: 'user_contacts#contact_list'

  # アカウントブロック
  post 'users/:user_id/questions/:id/block' , to: 'account_blocks#question_block'
  post 'users/:user_id/reviews/:id/block' , to: 'account_blocks#review_block'


  # イベント一覧
  get 'dates' , to: 'schedules#dates'
  get 'dates/:year' , to: 'schedules#year'
  get 'dates/:year/:month' , to: 'schedules#month'
  get 'dates/:year/:month/:day' , to: 'schedules#day'

  # 出欠管理
  get 'schedules/:unique_id/:id' , to: 'schedules#secret'
  scope 's/:unique_id' do
    resources :attendances
	end

  # サンプルの質問
	get 'users/:user_id/question' , to: 'questions#question'
	get 'users/:user_id/blogs' , to: 'blogs#user_blogs'
  get 'users/:user_id/gallery' , to: 'blogs#gallery'

  # お問い合わせ
  get 'users/:user_id/thanks/:random_id' , to: 'user_contacts#thanks'
  patch 'users/:user_id/contact_list/:id', to: 'user_contacts#update_contact'
  get 'check/thanks' , to: 'user_contacts#check_thanks'
  get 'check_r/:user_id/:random_id' , to: 'user_contacts#check_reaction'
  get 'check_v/:user_id/:random_id' , to: 'user_contacts#check_violation'


	# get 'users/:user_id/collection-sample' , to: 'collections#sample'

  # エリア別
	# get 'prefectures' , to: 'users#prefecture_index'
	# get 'prefectures/:kana' , to: 'users#prefecture'
	get 'prefectures/:kana/tag/:id' , to: 'tags#prefecture'
	get 'prefectures/:kana/:city_kana' , to: 'users#prefecture_city'
	get 'prefectures/:kana/:city_kana/:id' , to: 'users#prefecture_city_station'
	get 'prefectures/:kana/:city_kana/tag/:id' , to: 'tags#prefecture_city'

  # カテゴリー別
	get 'categories' , to: 'categories#index'
  get 'categories/prefectures' , to: 'categories#prefecture_index'
	get 'categories/prefectures/:kana' , to: 'categories#prefecture'
	get 'categories/:kana' , to: 'categories#category'
  get 'categories/:kana/:p_kana' , to: 'categories#category_prefecture'


  # ブログ
	get 'blog' , to: 'blogs#index'
	get 'blog/prefectures' , to: 'blogs#prefecture_index'
	get 'blog/prefectures/:kana' , to: 'blogs#prefecture'
	get 'blog/:ruby' , to: 'blogs#event'
	get 'blog/:ruby/:kana' , to: 'blogs#event_prefecture'

  # コート情報
	scope 'coat' do
		resources :places, except: [:index, :show] do
      resources :place_reviews
    end
	end
	get 'places' , to: 'places#index'
	get 'places/count' , to: 'places#count'
	get 'places/all' , to: 'places#no_index'
  get 'places/all/:kana/:city_kana/:id' , to: 'places#show_noindex'
	get 'places/:ruby' , to: 'places#event'
	get 'places/:ruby/search' , to: 'places#search'
	get 'places/:ruby/:kana' , to: 'places#prefecture'
	get 'places/:ruby/:kana/:city_kana' , to: 'places#city'
	get 'places/:ruby/:kana/:city_kana/:id' , to: 'places#show'

  # 練習試合
	get	'matches/:id/contact' , to: 'matches#contact'
	get 'match' , to: 'matches#match'
	get 'match/prefectures/:kana' , to: 'matches#prefecture'
	get 'match/:ruby' , to: 'matches#event'
	get 'match/:ruby/:kana' , to: 'matches#event_prefecture'

	get 'link/:unique_id', to: 'links#link'
	get 'u/:unique_id', to: 'links#unique_page'

  # タグ検索
	get 'tag/:id' , to: 'tags#index'





  # 種目別
	# get ':ruby' , to: 'users#event'
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




  # 301リダイレクト
  get 'users/', to: redirect('circles')
  get 'users/:id', to: redirect('circles/%{id}')
  get 'schedules/:unique_id', to: redirect("s/%{unique_id}/attendances")
	get ':ruby' , to: redirect('events/%{ruby}')


end
