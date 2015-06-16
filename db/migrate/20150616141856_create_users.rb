class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |u|
      u.string :username, null: false
      u.string :password, null: false
      u.timestamps
    end
  end
end
