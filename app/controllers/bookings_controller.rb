class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:selected_flight])
    @origin_airport = Airport.find(@selected_flight.origin_id).name
    @destination_airport = Airport.find(@selected_flight.destination_id).name
    @departure_time = @selected_flight.departure_time
    @duration = @selected_flight.duration
    @passenger_number = params[:passenger_number]
    @passenger_number.to_i.times { @booking.passengers.build }
    @i = 1
  end

  def create
    #@passenger_number.to_i.times { @booking.passengers.build }
    @booking = Booking.new(booking_params)

    if @booking.save!
      flash[:success] = "Your flight has been booked!"
      redirect_to root_url
    else
      flash.now[:danger] = "Problems"
      render :new
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, { :passengers_attributes => [:name, :email] })
    end
end
