class Student_super
  attr_reader :id
  attr_accessor :surname
  attr_reader :git

  VALID_GIT = /\Ahttps:\/\/github\.com\/w+\z/

  private_class_method: new

  def update_git(new_git)
    @git = new_git
    validate_git
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}"
  end

  def self.is_valid_git?(git)
    git =~VALID_GIT
  end

  def validate_git
    if @git && !self.is_valid_git?(@git)
        raise ArgumentError, "Git in wrong format."
    end
  end

  def validate_git_presence
    return true if git
    puts "Git field is required"
    false
  end

end
