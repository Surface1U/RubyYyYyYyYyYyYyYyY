require_relative 'Student_super'

class Student_short < Student_super

  attr_accessor: contact

  def initialize (params = {id: '', surname: '', git: '', contact: ''})
    super(id, surname, git)
    @id = params[:id]
    @surname = params[:surname]
    @git = params [:git]
    @contact = contact

    validate_git
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end
