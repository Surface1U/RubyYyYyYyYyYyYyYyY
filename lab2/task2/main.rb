require_relative 'student'
require_relative 'student_short'

st3=Student.from_json_str('{"first_name":"Jonathan", "second_name": "Howsmon", "last_name": "Davis"}')
st3.set_contacts(**{phone: '87777777777'})
puts st3
puts st3.get_info
#
st_sh1=StudentShort.new(5,'{"short_name": "Davis J.D.", "git": "@fuic"}')

puts st_sh1

st_sh2=StudentShort.init_from_student(st3)
puts st_sh2

def read_from_txt(file_path)
  raise ArgumentError, 'File not found' unless File.exist?(file_path)

  file = File.open(file_path){|file| file.read}
  JSON.parse(file).inject([]) do |list, student|
    list << Student.from_json_str(student.to_json)
  end

end


def write_to_txt(file_path, student_list)
  res = '['
  student_list.each do |st|

    res += st.to_json_str + ","
  end
  res = res.chop + "]"
  File.write(file_path, res)
end

puts '------------test read'
st_list=read_from_txt('texts\students_info.txt')
st_list.each do |st|
  puts st.get_info
end
puts '-------- test write'
write_to_txt('texts\students_out.txt',st_list)
puts read_from_txt('tests\students_out.txt')
