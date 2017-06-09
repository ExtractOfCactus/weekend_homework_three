require('pg')

class SqlRunner

  def run(sql)
    begin
      db = ({dbname: "codeclan_cinema", host: "localhost"})
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end

end