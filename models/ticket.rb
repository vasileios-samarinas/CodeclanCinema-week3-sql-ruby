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
