require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :films_id, :screening_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"].to_i
    @films_id = options["films_id"].to_i
    @screening_id = options["screening_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, films_id, screening_id)
    VALUES ($1, $2, $3) RETURNING id;"
    values = [@customer_id, @films_id, @screening_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    results = SqlRunner.run(sql)
    return results.map { |ticket_hash| Ticket.new(ticket_hash)}
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, films_id, screening_id) =
    ($1, $2, $3) WHERE id = $4"
    values = [@customer_id, @films_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

end
