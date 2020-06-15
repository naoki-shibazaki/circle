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

  Difference.find_each do |difference|
    add "/contents/differences/#{difference.id}", :lastmod => difference.updated_at, :priority => 0.2, :changefreq => 'weekly'    
  end



  Prefecture.find_each do |prefecture|

    if prefecture.kana != "nil"
      add "/blog/prefectures/#{prefecture.kana}", :lastmod => prefecture.updated_at, :priority => 0.3, :changefreq => 'weekly'
      add "/prefectures/#{prefecture.kana}", :lastmod => prefecture.updated_at, :priority => 0.8, :changefreq => 'daily' 


      Tag.find_each do |prefecture_tag|
        add "/prefectures/#{prefecture.kana}/tag/#{prefecture_tag.id}", :lastmod => prefecture.updated_at, :priority => 0.5, :changefreq => 'weekly'
      end

      
          City.where(prefecture_id: prefecture.id).find_each do |prefecture_city|
            add "/prefectures/#{prefecture.kana}/#{prefecture_city.city_kana}", :lastmod => prefecture_city.updated_at, :priority => 0.8, :changefreq => 'weekly'

            Station.where(city_id: prefecture_city.id).find_each do |prefecture_station|
              add "/prefectures/#{prefecture.kana}/#{prefecture_city.city_kana}/#{prefecture_station.id}", :lastmod => prefecture.updated_at, :priority => 0.5, :changefreq => 'weekly'
            end

            Tag.find_each do |prefecture_city_tag|
              add "/prefectures/#{prefecture.kana}/#{prefecture_city.city_kana}/tag/#{prefecture_city_tag.id}", :lastmod => prefecture.updated_at, :priority => 0.5, :changefreq => 'weekly'
            end


          end 



    end

  end


  Event.find_each do |event|

    if event.ruby != "nil"

      add "/#{event.ruby}", :lastmod => event.updated_at, :priority => 0.8, :changefreq => 'daily'
      add "/blog/#{event.ruby}", :lastmod => event.updated_at, :priority => 0.3, :changefreq => 'weekly'
      add "/places/basketball", :lastmod => event.updated_at, :priority => 0.5, :changefreq => 'weekly'
      add "/#{event.ruby}/qa", :lastmod => event.updated_at, :priority => 0.2, :changefreq => 'weekly'

      Tag.find_each do |event_tag|
        add "/#{event.ruby}/tag/#{event_tag.id}", :lastmod => event.updated_at, :priority => 0.5, :changefreq => 'weekly'
      end

      EventQuestion.where(event_id: event.id).find_each do |event_question|
        add "/#{event.ruby}/qa/#{event_question.id}", :lastmod => event_question.updated_at, :priority => 0.3, :changefreq => 'weekly'    
      end

        Prefecture.find_each do |event_prefecture|
          
                if event_prefecture.kana != "nil"
                  add "/#{event.ruby}/#{event_prefecture.kana}", :lastmod => event_prefecture.updated_at, :priority => 1.0, :changefreq => 'daily'
                  add "/blog/#{event.ruby}/#{event_prefecture.kana}", :lastmod => event_prefecture.updated_at, :priority => 0.3, :changefreq => 'weekly'
                  add "/places/basketball/#{event_prefecture.kana}", :lastmod => event_prefecture.updated_at, :priority => 0.5, :changefreq => 'weekly'
               
                  Tag.find_each do |event_prefecture_tag|
                    add "/#{event.ruby}/#{event_prefecture.kana}/tag/#{event_prefecture_tag.id}", :lastmod => event.updated_at, :priority => 0.5, :changefreq => 'weekly'
                  end

                        City.where(prefecture_id: event_prefecture.id).find_each do |city|
                          add "/#{event.ruby}/#{event_prefecture.kana}/#{city.city_kana}", :lastmod => city.updated_at, :priority => 0.8, :changefreq => 'weekly'
                          add "/places/basketball/#{event_prefecture.kana}/#{city.city_kana}", :lastmod => city.updated_at, :priority => 0.5, :changefreq => 'weekly'

                          Station.where(city_id: city.id).find_each do |event_station|
                            add "/#{event.ruby}/#{event_prefecture.kana}/#{city.city_kana}/#{event_station.id}", :lastmod => event.updated_at, :priority => 0.5, :changefreq => 'weekly'
                          end

                          Tag.find_each do |event_city_tag|
                            add "/#{event.ruby}/#{event_prefecture.kana}/#{city.city_kana}/tag/#{event_city_tag.id}", :lastmod => event.updated_at, :priority => 0.5, :changefreq => 'weekly'
                          end

                          Place.where(event_id: event.id).where(prefecture_id: event_prefecture.id).where(city_id: city.id).find_each do |place|
                            add "/places/basketball/#{event_prefecture.kana}/#{city.city_kana}/#{place.id}", :lastmod => place.updated_at, :priority => 0.7, :changefreq => 'daily'
                          end 

                        end 
                 end
        end

    end      

  end




end