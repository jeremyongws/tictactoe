class Url < ActiveRecord::Base
  validates :url, format: { with: /(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/, message: "is invalid"}
  validates :key, uniqueness: true
  belongs_to :user
  before_save :generate_short_url

  # Remember to create a migration!
  def generate_short_url
    begin
      self.key = Faker::Lorem.characters(4)
    end until Url.where(key: key).empty?
  end

end
