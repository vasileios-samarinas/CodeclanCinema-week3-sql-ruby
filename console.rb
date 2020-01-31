require_relative( 'models/customer' )
require_relative( 'models/film')
require_relative( 'models/ticket')



require( 'pry-byebug' )

customer1 =Customer.new({'name' => 'Mike','funds'=>'100'})
customer1.save()
customer2 =Customer.new({'name'=>'David','funds'=>'200'})
customer2.save()
customer3=Customer.new({'name'=>'Helen','funds'=>'300'})
customer3.save()


film1=Film.new({'title'=>'Iron Man','price'=>'10'})
film1.save()
film3=Film.new({'title'=>'Dragonball','price'=>'20'})
film3.save()

ticket1=Ticket.new({'customer_id'=> customer1.id},'film_id'=>film1.id)
ticket1.save()
ticket2=Ticket.new({'customer_id'=> customer3.id, 'film_id'=>film1.id})
ticket2.save()
ticket3=Ticket.new({'customer_id'=> customer1.id, 'film_id'=>film2.id})
ticket3.save()
ticket4=Ticket.new({'customer_id'=> customer2.id, 'film_id'=>film2.id})
ticket4.save()
ticket5=Ticket.new({'customer_id'=> customer3.id, 'film_id'=>film1.id})
ticket5.save()

binding.pry
nil
