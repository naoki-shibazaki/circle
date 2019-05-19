# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.circle-book.com/"

SitemapGenerator::Sitemap.create do

  add users_path, :priority => 0.7, :changefreq => 'daily'
  add blogs_path, :priority => 0.7, :changefreq => 'daily'

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end

  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at
  end

end