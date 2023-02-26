class Student


  PHONE = /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/

  attr_accessor :name, :surname, :lastname, :phone

  def Student.correct_phone?(str)
    str.match?([PHONE])
  end

  def initialize(arg = {})
    @name = arg[:name]
    @surname = arg[:surname]
    @lastname = arg[:lastname]
    @phone = arg[:phone]
  end

  def set_phone(phone)
    raise(ArgumentError, 'Not avalible phone') if phone && !Student.correct_phone?(phone)

    @phone = phone
  end

  def get_info
    puts "#{name}, #{surname}, #{lastname}, #{phone}"
  end


end
