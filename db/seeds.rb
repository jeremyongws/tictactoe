require_relative '../app/models/user.rb'
require_relative '../app/models/url.rb'

# 100.times do |x|
#   User.create(email: Faker::Internet.email, password: Faker::Internet.password(3))
# end

1000.times do |x|
  Url.create(url: Faker::Internet.url, user_id: User.pluck(:id).sample)
end

