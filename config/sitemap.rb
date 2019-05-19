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
  add users_path, :priority => 0.7, :changefreq => 'daily'
  add blogs_path, :priority => 0.7, :changefreq => 'daily'
  add prefectures_path, :priority => 0.7, :changefreq => 'daily'
  add events_path, :priority => 0.7, :changefreq => 'daily'

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end

  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at
  end

end