enable :sessions

get '/' do
  erb :index
end

post '/login' do
  if User.authenticate(params[:username], params[:password]) != nil
    user = User.find_by(username: params[:username])
    # "session_id = " << session[:session_id]
    session[:id] = user.id
    session[:username] = user.username
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
    erb :lobby
  else
    redirect to('/')
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end

get '/users/new' do
  erb :signup_page
end

post '/users/new' do
  User.create(username: params[:username], password: params[:password])
  redirect to("/")
end
