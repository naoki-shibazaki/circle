crumb :root do
  link "TOP", root_path
end

# circle
crumb :circle_show do |user|
  link "#{user.name}", circle_path(user)
  parent :root
end
