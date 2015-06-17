class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :moves

    validates :username, uniqueness: true
  def self.authenticate(username, password)
    if self.where(username: username)[0] == self.where(password: password)[0]
      return self.where(username: username)
    else
      return nil
    end
  end
end
