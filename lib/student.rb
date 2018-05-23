class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, data|
      self.send(("#{key}="), data)
      @@all << self
    end
  end

  def self.create_from_collection(students_array)
    students_array.each do |data|
      self.new(data)
    end
  end

  def add_student_attributes(attributes_hash)
    student_hash.each do |key, data|
      self.send(("#{key}="), data)
  end

  def self.all
    @@all
  end
end
