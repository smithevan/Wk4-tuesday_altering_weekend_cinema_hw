require ("pry")

require_relative ("./models/customer")
require_relative ("./models/film")
require_relative ("./models/ticket")
require_relative ("./models/screening")

Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  "name" => "Jim",
  "funds" => 100
  })

customer2 = Customer.new({
  "name" => "Robert",
  "funds" => 50
  })

customer3 = Customer.new({
  "name" => "Maeve",
  "funds" => 120
  })

customer4 = Customer.new({
  "name" => "Alexandra",
  "funds" => 110
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()

film1 = Film.new({
  "title" => "Avengers",
  "price" => 10
  })

film2 = Film.new({
  "title" => "Godfather",
  "price" => 8
  })

film3 = Film.new({
  "title" => "Matrix",
  "price" => 12
  })

film1.save()
film2.save()
film3.save()

#screening film 1 at 17:00
screening1 = Screening.new({
  "showtime" => "17:00",
  "film_id" => film1.id
  })

#screening film 2 at 19:00
screening2 = Screening.new({
  "showtime" => "19:00",
  "film_id" => film2.id
  })

#screening film 3 at 23:00
screening3 = Screening.new({
  "showtime" => "23:00",
  "film_id" => film3.id
  })

#screening film 1 at 20:00
screening4 = Screening.new({
  "showtime" => "20:00",
  "film_id" => film1.id
  })

# screening1.save()
# screening2.save()
# screening3.save()
# screening4.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "films_id" => film1.id,
  "screening_id" => screening1.id
  })

ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "films_id" => film2.id,
  "screening_id" => screening2.id
  })

ticket3 = Ticket.new({
  "customer_id" => customer1.id,
  "films_id" => film3.id,
  "screening_id" => screening3.id
  })

ticket4 = Ticket.new({
  "customer_id" => customer3.id,
  "films_id" => film1.id,
  "screening_id" => screening4.id
  })

ticket5 = Ticket.new({
  "customer_id" => customer4.id,
  "films_id" => film1.id,
  "screening_id" => screening4.id
  })

# ticket1.save()
# ticket2.save()
# ticket3.save()
# ticket4.save()
# ticket5.save()










binding.pry
nil
