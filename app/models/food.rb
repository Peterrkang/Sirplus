class Food < ActiveRecord::Base
  belongs_to :provider

  def self.get_expiration_time(hours, minutes)
    time_in_seconds = (minutes.to_i * 60) + (hours.to_i * 60 * 60)
    Time.now + time_in_seconds
  end

  def get_coordinates
    # User Google maps geolocating API to convert address to longitude and latitude
    # Return array with [longitude, latitude]
    return [nil, nil]
  end
end
