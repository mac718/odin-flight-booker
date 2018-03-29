class FlightsController < ApplicationController
  def index
    @dates = Flight.departure_dates
    @airports = Airport.names
    @passengers = (1..4)
    unless params[:origin].empty?
    @flights = Flight.where("departure_time = ? AND origin_id = ? AND destination_id = ?",
      params[:departure_time][0..-5], Airport.where("name = ?", params[:origin])[0].id, 
      Airport.where("name = ?", params[:destination])[0].id)
    end
  end
end
