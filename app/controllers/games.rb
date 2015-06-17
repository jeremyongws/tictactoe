get '/lobby' do

  @games = Game.where(player2_id: nil)
  # byebug
  erb :lobby
end

get '/games/new' do
  @user = User.find(session[:id])

  @game = Game.create(player1_id: @user.id)
  @player = 1

  # {game_id: @game.id}.to_json

  erb :game

end

get '/game/:game_id' do
  erb :game
end

get '/play_game' do

  @user = User.find(session[:id])



  erb :game
end

get '/games/:game_id/join' do

 @user = User.find(session[:id])
 @game = Game.find(params[:game_id])
 @game.update(player2_id: @user.id)
 @player = 2


erb :game

end

post '/game/moves' do

 @game = Game.find(params[:game])


  if params[:player] == "1"
    @user = User.find(@game.player1_id)
    @activePlayer = 2
  else
    @user = User.find(@game.player2_id)
    @activePlayer = 1
  end


  @move = Move.create(game_id: @game.id, user_id: @user.id, box: params[:box], move_num: params[:move], player_num: params[:player].to_i)
  # byebug
  {activePlayer: @activePlayer }.to_json

  # //get move and active player

  # //send back active player
end

get '/game/status/:game_id' do
  @game = Game.find(params[:game_id])
  @moves = @game.moves
  # byebug
  erb :test, layout: false
end

      # m.integer :game_id
      # m.integer :user_id
      # m.string :box
      # m.integer :move_num


     #  g.integer :player1_id
     #  g.integer :player2_id
     #  g.integer :starter_id
     #  g.integer :winner_id
     #  g.boolean :ended, null: false, default: false
