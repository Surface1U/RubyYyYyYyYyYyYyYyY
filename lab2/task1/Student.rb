class Student
  attr_accessor :name, :surname, :lastname

  def initialize(arg = {})
    @name = arg[:name]
    @surname = arg[:surname]
    @lastname = arg[:lastname]
  end

  def get_info
    puts "#{name}, #{surname}, #{lastname}"
  end
end

obj = Student.new()
obj.name = "ssss"
obj.surname = "sss"
obj.lastname = "sss"
obj.get_info()
