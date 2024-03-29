require 'sqlite3'
class StudentDB
  @@instance = nil
  private def initialize
    @db = SQLite3::Database.open 'C:\db_student.sql'
    @db.results_as_hash=true
  end

  def self.instance
    if @@instance.nil?
      @@instance=StudentDB.new
    end
    @@instance
  end

  def execute(query, *args)
    @db.execute(query,*args)
  end

  def results_as_hash=(bool)
    @db.results_as_hash=bool
  end

end
