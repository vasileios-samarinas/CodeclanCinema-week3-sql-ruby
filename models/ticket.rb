require_relative("../db/sql_runner")
require_relative("film")
require_relative("customer")


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id =options['id'].to_i if options['id']
    @customer_id =options['customer_id']
    @film_id =options['film_id']
  end

  def save()
    sql= "INSERT INTO tickets(customer_id,film_id)
    VALUES($1,$2)RETURNING id"
    values=[@customer_id,@film_id]
    ticket= SqlRunner.run(sql,values).first
    @id=ticket['id'].to_i
  end

  def customer()
    sql="SELECT * FROM customers where id =$1"
    values=[@customer_id]
    customer=SqlRunner.run(sql,values).first
    return Customer.new(customer)
  end

  def film()
    sql="SELECT * FROM films where id=$1"
    values=[@film_id]
    film=SqlRunner.new(sql,values).first
    return Film.new(film)
  end

  def delete()
    sql="DELETE FROM tickets where id=$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql="SELECT * FROM tickets"
    ticket_data=SqlRunner.run(sql)
    return Ticket.map_items(ticket_data)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(ticket_data)
    result=ticket_data.map{|ticket|Ticket.new(ticket)}
    return result
  end


end
