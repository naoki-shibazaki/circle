# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.circle-book.com'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_S3_BUCKET']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['AWS_S3_BUCKET'],
  aws_access_key_id: ENV['AWS_IAM_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_IAM_ACCESS_KEY'],
  aws_region: ENV['AWS_S3_REGION'],
)

SitemapGenerator::Sitemap.create do

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at, :priority => 0.7, :changefreq => 'daily'
  end

  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at, :priority => 0.5, :changefreq => 'daily'
  end




  Prefecture.find_each do |prefecture|

    if prefecture.kana != "nil"
      add "/prefectures/#{prefecture.kana}", :lastmod => prefecture.updated_at, :priority => 0.8, :changefreq => 'daily'
      add "/blog/prefectures/#{prefecture.kana}", :lastmod => prefecture.updated_at, :priority => 0.3, :changefreq => 'weekly'

          Group.find_each do |prefecture_group|
                add "/prefectures/#{prefecture.kana}/#{prefecture_group.group}", :lastmod => prefecture_group.updated_at, :priority => 0.3, :changefreq => 'weekly'

                Age.find_each do |prefecture_age|
                      add "/prefectures/#{prefecture.kana}/#{prefecture_group.group}/#{prefecture_age.decade}", :lastmod => prefecture_age.updated_at, :priority => 0.3, :changefreq => 'weekly'
                end

          end
    end

  end




  Event.find_each do |event|

    if event.ruby != "nil"

      add "/#{event.ruby}", :lastmod => event.updated_at, :priority => 0.8, :changefreq => 'daily'
      add "/blog/#{event.ruby}", :lastmod => event.updated_at, :priority => 0.3, :changefreq => 'weekly'

        Prefecture.find_each do |event_prefecture|
          
                if event_prefecture.kana != "nil"
                  add "/#{event.ruby}/#{event_prefecture.kana}", :lastmod => event_prefecture.updated_at, :priority => 1.0, :changefreq => 'daily'
                  add "/blog/#{event.ruby}/#{event_prefecture.kana}", :lastmod => event_prefecture.updated_at, :priority => 0.3, :changefreq => 'weekly'
               
                        Age.find_each do |age|
                              add "/#{event.ruby}/#{event_prefecture.kana}/#{age.decade}", :lastmod => age.updated_at, :priority => 0.3, :changefreq => 'weekly'
                        end

                        Group.find_each do |group|
                              add "/#{event.ruby}/#{event_prefecture.kana}/#{group.group}", :lastmod => group.updated_at, :priority => 0.3, :changefreq => 'weekly'
                        end

                 end

        end

    end      

  end





end