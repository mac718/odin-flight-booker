class PassengerMailer < ApplicationMailer
  default from: 'notifications@odinflightbooker.com'

  def thank_you_email(passenger, flight)
    @passenger = passenger
    @flight = Flight.find(flight)
    mail(to: @passenger.email, subject: "Thank you!" )
  end
end
