require_relative 'Student'

def create_four_students
  student1 = Student.new(surname:'Mans', name:'Man', middle_name:'dsf')
  student2 = Student.new(surname:'Manson', name:'Charles', phone: '+899898989', email: 'manson4@mail.ru')
  [student1, student2]
end

def print_students(students)
  students.each do |student|
    puts student
  end
end

def main
  student1, student2 = create_four_students

  print_students([student1, student2])
end

main
