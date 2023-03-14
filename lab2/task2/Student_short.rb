require_relative 'Student_super'

class Student_short < Student_super

 public_class_method :new

  private

  attr_writer :last_name_and_initials, :contact

  public

  attr_reader :last_name_and_initials, :contact


  def self.from_student(student)
    raise ArgumentError, 'Student ID is required' if student.id.nil?

    StudentShort.new(student.id, student.short_info)
  end
  
  
 def initialize(id, info_str)
    params = JSON.parse(info_str, { symbolize_names: true })
    raise ArgumentError, 'Fields required: last_name_and_initials' if !params.key?(:last_name_and_initials) || params[:last_name_and_initials].nil?

    self.id = id
    self.last_name_and_initials = params[:last_name_and_initials]
    self.contact = params[:contact]
    self.git = params[:git]

  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end
