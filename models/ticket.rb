require_relative("../db/sql_runner")
require_relative("film")
require_relative("customer")


class Ticket

def initialize(options)
  @id = options['id'].to_i if options['id']
  @customer_id =options['customer_id']
  @film_id=options['film_id']
end



end
