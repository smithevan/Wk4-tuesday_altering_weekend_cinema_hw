require_relative("../db/sql_runner")
require_relative("screening")


class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    results = SqlRunner.run(sql)
    return results.map { |film_hash| Film.new(film_hash)}
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* from customers
          INNER JOIN tickets on tickets.customer_id = customers.id
          WHERE films_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |customer_hash| Customer.new(customer_hash)}
  end

  def customers()
    sql = "SELECT customers.* from customers
          INNER JOIN tickets on tickets.customer_id = customers.id
          WHERE films_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |customer_hash| Customer.new(customer_hash)}
  end

  def audience_number()
    sql = "SELECT customers.* from customers
          INNER JOIN tickets on tickets.customer_id = customers.id
          WHERE films_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.count
  end

  def showtimes()
    sql = "SELECT screenings.* from screenings
          WHERE film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |showtime_hash| Screening.new(showtime_hash)}
  end

  def most_popular()
    sql = "SELECT screenings.* from screenings
           INNER JOIN tickets ON tickets.screening_id = screenings.id
           Where film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    shows = results.map { |hash| Screening.new(hash)}
    shows.max {|hash| shows.count(hash)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
  #  film = results.map { |hash| Film.new(hash)}
  end







end
