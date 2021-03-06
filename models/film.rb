require_relative('../db/sql_runner')

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price )
     VALUES ( '#{@title}', #{@price} ) RETURNING id"
     film = SqlRunner.run(sql).first()
     @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (
    title,
    price
    ) = (
    '#{@title}',
    #{@price}
    ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
      INNER JOIN tickets
      ON tickets.customer_id = customers.id
      WHERE tickets.film_id = #{@id}"
    customer_hashes = SqlRunner.run(sql)
    result = customer_hashes.map {|customer_hash| Customer.new(customer_hash)}
    return result
  end

  def number_of_customers()
    customers().length()
  end

end