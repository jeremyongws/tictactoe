class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |m|
      m.integer :game_id
      m.integer :user_id
      m.string :box
      m.integer :move_num
    end
  end
end
