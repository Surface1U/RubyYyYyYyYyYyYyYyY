require_relative 'Student_super'

class Student_short < Student_super

  attr_accessor: contact
  
  def StudentShort.from_string(id, str)
    hash = super(id, str)
    new(Student.new(hash))
  end

  attr_reader :id, :full_name,
              :git, :contacts

  protected :last_name, :first_name, :patronymic,
            :phone, :telegram, :email,
            :last_name=, :first_name=, :patronymic=,
            :phone=, :telegram=, :email=

  def initialize(obj)
    @id = obj.id
    @full_name = "#{obj.last_name} #{obj.first_name[0]}.#{obj.patronymic[0]}."
    @git = obj.git
    @contacts = "#{obj.phone ? obj.phone : '-'}, #{obj.telegram ? obj.telegram : '-'}, #{obj.email ? obj.email : '-'}"
  end
 

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end
