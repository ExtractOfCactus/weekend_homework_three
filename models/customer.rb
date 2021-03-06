require_relative('../db/sql_runner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds )
     VALUES ( '#{@name}', #{@funds} ) RETURNING id"
     customer = SqlRunner.run(sql).first()
     @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (
    name,
    funds
    ) = (
    '#{@name}',
    #{@funds}
    ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE tickets.customer_id = #{@id}"
    film_hashes = SqlRunner.run(sql)
    return film_hashes.map {|film_hash| Film.new(film_hash)}
  end

  def payment()
    films().each {|film| @funds -= film.price()}
    update()
    return @funds
  end

  def number_of_tickets()
    films().length()
  end

end