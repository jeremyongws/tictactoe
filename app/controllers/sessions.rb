require_relative '../models/user'
enable :sessions

post '/login' do
  if User.authenticate(params[:email], params[:password]) != nil
    user = User.find_by(email: params[:email])
    # "session_id = " << session[:session_id]
    session[:id] = user.id
    session[:email] = user.email
    # byebug
    redirect to("/login/#{user.id}")
  else
    redirect to('/')
  end
end

# get '/login/:session_id' do
#   erb :secret_page
# end

get '/login/:id' do
  if session[:id] != nil
    # byebug
    erb :secret_page
  else
    redirect to('/')
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end
