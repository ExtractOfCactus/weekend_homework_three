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

end