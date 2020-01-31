require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title=options['title']
    @price=options['price']
  end



end
