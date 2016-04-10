class Food < ActiveRecord::Base
  belongs_to :provider

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def self.get_expiration_time(hours, minutes)
    time_in_seconds = (minutes.to_i * 60) + (hours.to_i * 60 * 60)
    Time.now + time_in_seconds
  end
end
