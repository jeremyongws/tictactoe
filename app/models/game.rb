class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :moves
end
