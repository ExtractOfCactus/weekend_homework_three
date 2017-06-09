require('pry-byebug')
require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

customer_1 = Customer.new({ "name" => "Michael", "funds" => 50 })
customer_2 = Customer.new({ "name" => "Gob", "funds" => 20 })
customer_3 = Customer.new({ "name" => "Buster", "funds" => 10 })
customer_4 = Customer.new({ "name" => "Lindsay", "funds" => 25})


film_1 = Film.new({ "title" => "Wonder Woman", "price" => 10 })
film_2 = Film.new({ "title" => "Godzilla", "price" => 6 })
film_3 = Film.new({ "title" => "Fight Club", "price" => 12 })
film_4 = Film.new({ "title" => "Inception", "price" => 8 })


ticket_1 = Ticket.new({ "customer id" => customer_1.id, "film id" => film_1.id })
ticket_2 = Ticket.new({ "customer id" => customer_3.id, "film id" => film_3.id })
ticket_3 = Ticket.new({ "customer id" => customer_2.id, "film id" => film_4.id })
ticket_4 = Ticket.new({ "customer id" => customer_2.id, "film id" => film_1.id })
