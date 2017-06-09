require('pry-byebug')
require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

customer_1 = Customer.new({ "name" => "Michael", "funds" => 50 })
customer_2 = Customer.new({ "name" => "Gob", "funds" => 20 })
customer_3 = Customer.new({ "name" => "Buster", "funds" => 10 })
customer_4 = Customer.new({ "name" => "Lindsay", "funds" => 25})

customer_1.save()
customer_2.save()
customer_3.save()
customer_4.save()


film_1 = Film.new({ "title" => "Wonder Woman", "price" => 10 })
film_2 = Film.new({ "title" => "Godzilla", "price" => 6 })
film_3 = Film.new({ "title" => "Fight Club", "price" => 12 })
film_4 = Film.new({ "title" => "Inception", "price" => 8 })

film_1.save()
film_2.save()
film_3.save()
film_4.save()


ticket_1 = Ticket.new({ "customer_id" => customer_1.id, "film_id" => film_1.id })
ticket_2 = Ticket.new({ "customer_id" => customer_3.id, "film_id" => film_3.id })
ticket_3 = Ticket.new({ "customer_id" => customer_2.id, "film_id" => film_4.id })
ticket_4 = Ticket.new({ "customer_id" => customer_2.id, "film_id" => film_1.id })

ticket_1.save()
ticket_2.save()
ticket_3.save()
ticket_4.save()



binding.pry
nil