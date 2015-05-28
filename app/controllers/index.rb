require_relative '../models/url'

get '/' do
  erb :index
end

post '/urls' do
  @url = Url.new(url: params[:urltobeshortened])
  if @url.save
    @key = @url.key
    redirect to("/urls/#{@key}")
  else
    erb :index
  end
end

get '/urls/:key' do
  erb :show_shortened_url
end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.where(key: params["short_url"])[0]
  @url.counter += 1
  @url.save
  if @url.url.include?("http://") || @url.url.include?("https://")
    redirect("#{@url.url}")
  else
    redirect("http://#{@url.url}")
  end
end