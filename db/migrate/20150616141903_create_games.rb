class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |g|
      g.integer :player1_id
      g.integer :player2_id
      g.integer :starter_id
      g.integer :winner_id
      g.boolean :ended, null: false, default: false

      g.timestamps
    end
  end
end
