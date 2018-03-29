4.times do 
  alphabet_arr = ('A'..'Z').to_a
  name = "#{alphabet_arr.sample + alphabet_arr.sample + alphabet_arr.sample}"
  Airport.create(name: name)
end

50.times do
  origin_id = (1..2).to_a.sample
  destination_id = (3..4).to_a.sample
  departure_time = Faker::Time.forward(50)
  arrival_time = departure_time + 4.hours#Faker::Time.between(departure_time, departure_time + 1.day)#86400)
  duration = "#{((arrival_time - departure_time)/60/60).to_s} hours"
  Flight.create(origin_id: origin_id, destination_id: destination_id, departure_time: departure_time, 
    arrival_time: arrival_time, duration: duration)
end
