source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'execjs'
gem 'therubyracer'


gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
# gem 'turbolinks', '~> 2.5.3'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'

gem 'gretel'
gem 'zeroclipboard-rails'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'seed-fu'
gem 'paperclip'

gem 'rails-i18n'

gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'

gem 'kaminari'
gem 'jquery-rails'

gem 'newrelic_rpm' # heroku add on

gem 'bootstrap-sass', '~> 3.3.7'
gem "font-awesome-rails"
# gem "bootstrap4-datetime-picker-rails"
gem 'momentjs-rails'
gem "rack-cors"

gem 'carrierwave'

gem 'cloudinary'
gem 'dotenv-rails'

gem 'fog-aws'
gem "aws-sdk-s3", require: false

gem 'meta-tags'
gem 'sitemap_generator'
gem 'aws-sdk'
gem 'whenever', :require => false
gem 'rack-rewrite'

gem 'rinku'
gem 'rails_autolink'
gem 'ransack'
gem 'impressionist'
gem 'counter_culture'
gem 'cocoon'
gem 'trix'

gem 'hirb'         # 出力結果を表として出力するgem
gem 'hirb-unicode'  # マルチバイト文字の表示を補正するgem


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'derailed_benchmarks' #メモリ容量チェック
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

