class Flight < ApplicationRecord
  belongs_to :origin, :class_name => 'Airport'
  belongs_to :destination, :class_name => 'Airport'

  def self.departure_dates
    self.all.pluck(:departure_time).map { |date| date }#.strftime("%m/%d/%Y") }
  end
end
