class Student


  PHONE = /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/
  TELEGRAM = /^@[A-Za-z\d_]{5,32}$/
  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  GIT = /\Ahttps:\/\/github\.com\/\w+\z/

  attr_accessor :name, :surname, :lastname, :phone, :telegram, :git, :email

  def Student.correct_phone?(str)
    str.match?(PHONE)
  end

  def Student.correct_telegram?(str)
    str.match?(TELEGRAM)
  end

  def Student.correct_email?(str)
    str.match?(EMAIL)
  end

  def Student.correct_git?(str)
    str.match?(GIT)
  end

  def initialize(arg = {})
    @name = arg[:name]
    @surname = arg[:surname]
    @lastname = arg[:lastname]
  end

  def set_contacts(phone, telegram, email, git)
    raise(ArgumentError, 'Not avalible phone') if phone && !Student.correct_phone?(phone)
    raise(ArgumentError, 'Not avalible telegram') if telegram && !Student.correct_telegram?(telegram)
    raise(ArgumentError, 'Not avalible email') if email && !Student.correct_email?(email)
    raise(ArgumentError, 'Not avalible git') if git && !Student.correct_git?(git)

    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def validate
    valid_git
    valid_other
  end

  def valid_git
    raise(ArgumentError,  "You don't write a git id") unless git
  end
  def valid_other
    raise(ArgumentError, 'You must write at list one contact') unless phone || telegram || email
  end

  def get_info
    puts "#{name}, #{surname}, #{lastname}, #{phone}, #{telegram}, #{email}, #{git}"
  end


end

obj = Student.new()
obj.name = "ssss"
obj.surname = "sss"
obj.lastname = "sss"
obj.email = "sss@gmail.com"
obj.get_info()
