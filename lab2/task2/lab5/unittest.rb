require 'minitest/autorun'
require_relative 'C:/Users/Alexander/rubyyyyy/student_model/student.rb'

class StudentTest < Minitest::Test
  def setup
    @student = Student.new(
      last_name: 'Иванович',
      first_name: 'Иван',
      second_name: 'Иванов',
      id: 12345,
      phone: '+79187474222',
      telegram: '@johndoe',
      email: 'johndoe@example.com',
      git: '@johndoe'
    )
  end

  def test_student_creation
    assert_equal 'Иванович', @student.last_name
    assert_equal 'Иван', @student.first_name
    assert_equal 'Иванов', @student.second_name
    assert_equal 12345, @student.id
    assert_equal '+79187474222', @student.phone
    assert_equal '@johndoe', @student.telegram
    assert_equal 'johndoe@example.com', @student.email
    assert_equal '@johndoe', @student.git
  end

  def test_short_name
    assert_equal 'Иванович И. И.', @student.short_name
  end

  def test_get_info
    expected_info = 'Иванович И. И. git=@johndoe'
    assert_equal expected_info, @student.get_info
  end

  def test_to_s
    expected_string = 'Иванович Иван Иванов id=12345 phone=+79187474222 git=@johndoe telegram=@johndoe email=johndoe@example.com'
    assert_equal expected_string, @student.to_s
  end

  def test_to_hash
    expected_hash = {
      last_name: 'Иванович',
      first_name: 'Иван',
      second_name: 'Иванов',
      id: 12345,
      phone: '+79187474222',
      telegram: '@johndoe',
      email: 'johndoe@example.com',
      git: '@johndoe'
    }
    assert_equal expected_hash, @student.to_hash
  end
end
