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
  current_time = Time.now
  add root_path, :lastmod => current_time, changefreq: 'daily', priority: 1.0

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at, :priority => 1.0, :changefreq => 'daily'
    add "/users/#{user.id}/schedules", :lastmod => current_time, :priority => 0.5, :changefreq => 'daily'
    add "/users/#{user.id}/reviews", :lastmod => current_time, :priority => 0.5, :changefreq => 'daily'
    add "/users/#{user.id}/questions", :lastmod => current_time, :priority => 0.3, :changefreq => 'daily'
  end

  DbKeyword.find_each do |keyword|
    add "/users/kw/#{keyword.keyword}", :lastmod => current_time, :priority => 0.7, :changefreq => 'daily'
  end

end