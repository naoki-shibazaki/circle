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
