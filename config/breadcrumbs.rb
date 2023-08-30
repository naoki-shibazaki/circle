crumb :root do
  link "TOP", root_path
end

# circle
crumb :circle_index do
  link "サークル一覧", circles_path
  parent :root
end

  ## events配下
  crumb :event_show do |event|
    link "#{event.name}", event_path(event.ruby)
    parent :circle_index
  end

  crumb :event_prefecture_show do |event, prefecture|
    link "#{prefecture.name}", event_prefecture_path(event.ruby, prefecture.kana)
    parent :event_show, event
  end

  crumb :event_prefecture_city do |event, prefecture, city|
    link "#{city.name}", event_prefecture_city_path(event.ruby, prefecture.kana, city.city_kana)
    parent :event_prefecture_show, event, prefecture
  end


  ## サークル詳細ページ
  crumb :circle_show do |user|
    link "#{user.name}", circle_path(user)
    parent :event_prefecture_show, user.event, user.prefecture
  end


  ## prefectures配下
  crumb :prefecture_show do |prefecture|
    link "#{prefecture.name}", prefecture_path(prefecture.kana)
    parent :circle_index
  end

  crumb :prefecture_city_show do |prefecture, city|
    link "#{city.name}", prefecture_city_path(prefecture.kana, city.city_kana)
    parent :prefecture_show, prefecture
  end


  ## tags配下
  crumb :tag_show do |tag|
    link "#{tag.name}", tag_path(tag.id)
    parent :circle_index
  end


# blog
crumb :blog_index do
  link "ブログ一覧", blogs_path
  parent :root
end