get '/lobby' do

  @games = Game.where(player2_id: nil)

  erb :lobby
end

get '/games/new' do
  @user = User.find(session[:id])

  @game = Game.create(player1_id: @user.id)

  {game_id: @game.id}.to_json

  # redirect to "/games/#{@game.id}"
end

get '/game/:game_id' do
  erb :game
end

get '/play_game' do
  erb :game
end

get '/games/:game_id/join' do

 @user = User.find(session[:id])
 @game = Game.find(params[:game_id])
 @game.update(player2_id: @user.id)

erb :game

end

