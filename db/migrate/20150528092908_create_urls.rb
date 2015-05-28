class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |x|
      x.string :url
      x.string :key
      x.integer :counter, :default => 0
    end
  end
end
