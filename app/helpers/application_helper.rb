module ApplicationHelper

def default_meta_tags
    {
      site: 'サークルブック',
      title: 'サークルブック',
      reverse: true,
      charset: 'utf-8',
      description: '【登録不要・無料で使える！】全国のスポーツ・趣味のサークルメンバー募集サイト！社会人や学生、初心者、経験者など、誰でも参加可能！バスケやバレー、フットサルなど無料で参加、メンバーの募集が簡単にできます！',
      keywords: 'サークル,スポーツ,趣味,団体,社会人,学生',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('/images/icon.jpg') },
        { href: image_url('/images/icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('/images/ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
          card: 'summary_large_image'
      }      
    }
 end

end
