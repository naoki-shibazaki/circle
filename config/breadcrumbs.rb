crumb :root do
  link "TOP", root_path
end

# circle
crumb :circle_index do
  link "サークル一覧", circles_path
  parent :root
end

crumb :circle_show do |user|
  link "#{user.name}", circle_path(user)
  parent :circle_index
end

crumb :event_show do |event|
  link "#{event.name}", event_path(event.ruby)
  parent :circle_index
end

crumb :prefecture_show do |prefecture|
  link "#{prefecture.name}", prefecture_path(prefecture.kana)
  parent :circle_index
end