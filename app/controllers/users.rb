require_relative '../models/user'

get '/users/new' do
  erb :signup_page
end

post '/users/new' do
  User.create(email: params[:email], password: params[:password])
  redirect to("/")
end