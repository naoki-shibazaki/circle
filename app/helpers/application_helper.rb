module ApplicationHelper

  def default_meta_tags
      {
        site: "サークルブック",
        title: "サークルブック",
        reverse: true,
        charset: "utf-8",
        description: "【完全無料／登録不要】47都道府県のサークルやチーム、団体のメンバー募集サイトです！スポーツや趣味など豊富に掲載！10代〜60代、社会人や学生、初心者、経験者など、誰でも参加可能！バスケやバレー、フットサルなど。無料で簡単にメンバー募集ができます！",
        keywords: "サークル,チーム,団体,スポーツ,趣味,社会人,学生",
        separator: "|",
        icon: [
          { href: image_url("https://circle-book.com/images/favicon.ico")},
          { href: image_url("https://circle-book.com/images/apple-touch-icon.png"), rel: "apple-touch-icon", sizes: "180x180", type: "image/jpg" },
        ],
        og: {
          site_name: :site,
          title: :title,
          description: :description,
          type: "website",
          url: request.original_url,
          image: image_url("/images/ogp.png"),
          locale: "ja_JP"
        },
        twitter: {
            card: "summary_large_image"
        }
      }
  end

    def lazysizes_image_tag(source, options={})
      options['data-src'] = source
      if options[:class].blank?
        options[:class] = "lazyload"
      else
        options[:class] = "lazyload #{options[:class]}"
      end
      image_tag("/images/loading.gif", options) + ("<noscript>#{image_tag(source, options)}</noscript>").html_safe
    end





end
