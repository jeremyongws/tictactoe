# post '/urls' do
#   byebug
#   if session[:id] != nil
#     @url = Url.new(url: params[:urltobeshortened], user_id: session[:id])
#     if @url.save
#       @key = @url.key
#       redirect to("/urls/#{@key}")
#     else
#       erb :index
#     end
#   else
#     @url = Url.new(url: params[:urltobeshortened])
#     if @url.save
#       @key = @url.key
#       redirect to("/urls/#{@key}")
#     else
#       erb :index
#     end
#   end
# end

# get '/urls/:key' do
#   erb :show_shortened_url
# end

# # e.g., /q6bda
# get '/:short_url' do
#   @url = Url.where(key: params["short_url"])[0]
#   # byebug
#   @url.counter += 1
#   @url.save
#   if @url.url.include?("http://") || @url.url.include?("https://")
#     redirect("#{@url.url}")
#   else
#     redirect("http://#{@url.url}")
#   end
# end