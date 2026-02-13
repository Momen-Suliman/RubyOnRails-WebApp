# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Section.delete_all
Student.delete_all
Course.delete_all
Prefix.delete_all

# Create Prefixes
prefixes = [
  Prefix.create!(name: "CS"),
  Prefix.create!(name: "MTH"),
  Prefix.create!(name: "PHYS"),
  Prefix.create!(name: "CHEM")
]

# Create Courses
courses = [
  Course.create!(prefix: prefixes[0], number: 3710, syllabus: "Web Apps Dev with Ruby on Rails"),
  Course.create!(prefix: prefixes[0], number: 4050, syllabus: "Algorithms & Analysis"),
  Course.create!(prefix: prefixes[1], number: 1410, syllabus: "Calculus I: Limits, Derivatives & Integrals"),
  Course.create!(prefix: prefixes[1], number: 3210, syllabus: "Applied Methods in Linear Algebra"),
  Course.create!(prefix: prefixes[2], number: 2110, syllabus: "General Physics I"),
  Course.create!(prefix: prefixes[3], number: 1110, syllabus: "General Chemistry I")
]

# Create Sections
sections = [
  Section.create!(course: courses[0], section_number: "001"),
  Section.create!(course: courses[0], section_number: "002"),
  Section.create!(course: courses[1], section_number: "001"),
  Section.create!(course: courses[2], section_number: "001"),
  Section.create!(course: courses[2], section_number: "002"),
  Section.create!(course: courses[3], section_number: "001"),
  Section.create!(course: courses[4], section_number: "001"),
  Section.create!(course: courses[5], section_number: "001")
]

# Create Students
students = [
  Student.create!(name: "Alice Johnson", student_id: 100001),
  Student.create!(name: "Bob Smith", student_id: 100002),
  Student.create!(name: "Charlie Brown", student_id: 100003),
  Student.create!(name: "Diana Prince", student_id: 100004),
  Student.create!(name: "Eve Williams", student_id: 100005),
  Student.create!(name: "Frank Miller", student_id: 100006)
]

# Associate students with sections
students[0].sections << sections[0]
students[0].sections << sections[2]

students[1].sections << sections[0]
students[1].sections << sections[3]

students[2].sections << sections[1]
students[2].sections << sections[5]

students[3].sections << sections[3]
students[3].sections << sections[6]

students[4].sections << sections[0]
students[4].sections << sections[1]
students[4].sections << sections[2]

students[5].sections << sections[7]
students[5].sections << sections[6]

puts "Seed data created successfully!"
puts "Prefixes: #{Prefix.count}"
puts "Courses: #{Course.count}"
puts "Sections: #{Section.count}"
puts "Students: #{Student.count}"
