module ApplicationHelper

def default_meta_tags
    {
      site: 'サークルブック',
      title: 'サークルブック',
      reverse: true,
      charset: 'utf-8',
      description: 'たった30秒で気になったサークルとLINEで連絡ができる！全国のスポーツや趣味など、サークルのメンバー募集サイトです。社会人や学生、初心者、経験者など、誰でも参加できます！全て無料で利用できます！',
      keywords: 'サークル,スポーツ,趣味,社会人,学生',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('/images/default.jpg') },
        { href: image_url('/images/default.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('/images/default.jpg'),
        locale: 'ja_JP'
      }
    }
 end

end
