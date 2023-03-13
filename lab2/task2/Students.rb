class Student
  attr_accessor :name, :surname, :telegram
  attr_reader :phone, :email

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE = /\A\+?\d{10}\z/

  def initialize(params = { name: '', surname: '', middle_name: '' })
    @id: params[:id]
    @surname: params[:name]
    @git: params[:git]
    @name = params[:name]
    @middle_name = params[:middle_name]

    set_contacts(params[:phone], params[:telegram], params[:email])

    raise ArgumentError, "Ur names are required" unless @name && @surname && @middle_name

    if !validate
        raise ArgumentError, "Where ?"
    end
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Name: #{@name}, Middle Name: #{@middle_name}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

  def self.from_string(string)
    id, surname, name, middle_name, phone, telegram, email, git = string.split(',')
    params = {
      id:id,
      surname:surname,
      name:name,
      middle_name: middle_name,
      phone: phone,
      telegram: telegram,
      email: email,
      git: git
    }
    new(params)
  end

  def self.read_from_txt(file_path)
    students = []
    begin
      File.open(file_path, 'r') do |file|
        file.each_line do |line|
          id, surname, name, middle_name, phone, telegram, email, git = line.split(',')
          params_to = {id:id, surname: surname, name: name, middle_name: middle_name,
          phone:phone, telegram: telegram, email: email, git: git}
          Student.new(params_to) << students
        end
    end
    students
    rescue=>exception
    raise "I cannot found this address #{file_path}. #{exception.message}"
    end
  end

  def self.write_to_txt(file_path, students)
    begin
        File.open(file_path, 'w') do |file|
            students.each do |student|
                file.puts "#{student.id},#{student.surname},#{student.name},#{student.middle_name},#{student.phone},#{student.telegram},#{student.email},#{student.git}"
            end
        end
        rescue => exception
        raise "File could not be written at the given address #{file_path}. Exception: #{exception.message}"
    end
end



  def set_phone_number(new_phone)
    if new_phone && !self.is_valid_phone?(new_phone)
        raise ArgumentError, "Phone in wrong format."
    end
    @phone = new_phone

  def set_email(new_email)
    if new_email && !self.is_valid_email?(new_email)
        raise ArgumentError, "Email in wrong format."
  end
    @email = email

# Set contacts
  def set_contacts(phone, telegram, email)
    set_phone_number(phone)
    set_email(email)

    @telegram = telegram
  end

  def get_info
    "#{get_name_info}, Git: #{@git}, #{get_contact_info}"
  end

  def get_name_info
    "#{@surname} #{@name[0]}.#{@middle_name[0]}."
  end

  def get_contact_info
    return "Phone: #{@phone}" if @phone
    return "Telegram: #{@telegram}" if @telegram
    "Email: #{@email}" if @email
  end

  def self.is_valid_phone?(phone)
    phone =~ VALID_PHONE
  end

  def self.is_valid_email?(email)
    email =~ VALID_EMAIL
  end

  private
  def validate?
    validate_git_presence && validate_contacts_presence
  end

  def validate_contacts_presence?
    return true if phone || telegram || email
    puts "At least one contact (phone, telegram, mail) is required"
    false
  end

end

