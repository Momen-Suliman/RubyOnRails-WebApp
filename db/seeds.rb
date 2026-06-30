# This file ensures the application has a realistic sample dataset for development.
# Run with: bin/rails db:seed

puts "Resetting and seeding the database..."

Section.delete_all
Student.delete_all
Course.delete_all
Prefix.delete_all

prefixes = [
  { name: "CS", description: "Computer Science" },
  { name: "MTH", description: "Mathematics" },
  { name: "PHYS", description: "Physics" },
  { name: "CHEM", description: "Chemistry" },
  { name: "ENG", description: "English" }
]

prefix_records = prefixes.map do |attrs|
  Prefix.create!(name: attrs[:name])
end

courses = [
  { prefix_name: "CS", number: 3710, syllabus: "Full-stack web applications with Ruby on Rails." },
  { prefix_name: "CS", number: 4050, syllabus: "Algorithms and data structure analysis." },
  { prefix_name: "MTH", number: 1410, syllabus: "Calculus I: limits, derivatives, and integrals." },
  { prefix_name: "MTH", number: 3210, syllabus: "Linear algebra for applied problem solving." },
  { prefix_name: "PHYS", number: 2110, syllabus: "General Physics I with motion and energy." },
  { prefix_name: "CHEM", number: 1110, syllabus: "Introductory chemistry with lab concepts." },
  { prefix_name: "ENG", number: 1101, syllabus: "Composition and academic writing fundamentals." }
]

course_records = courses.map do |attrs|
  prefix = prefix_records.find { |record| record.name == attrs[:prefix_name] }
  Course.create!(prefix: prefix, number: attrs[:number], syllabus: attrs[:syllabus])
end

sections = [
  { course_index: 0, section_number: "001" },
  { course_index: 0, section_number: "002" },
  { course_index: 1, section_number: "001" },
  { course_index: 2, section_number: "001" },
  { course_index: 2, section_number: "002" },
  { course_index: 3, section_number: "001" },
  { course_index: 4, section_number: "001" },
  { course_index: 5, section_number: "001" },
  { course_index: 6, section_number: "001" }
]

section_records = sections.map do |attrs|
  Section.create!(course: course_records[attrs[:course_index]], section_number: attrs[:section_number])
end

students = [
  { name: "Alice Johnson", student_id: 100001 },
  { name: "Bob Smith", student_id: 100002 },
  { name: "Charlie Brown", student_id: 100003 },
  { name: "Diana Prince", student_id: 100004 },
  { name: "Eve Williams", student_id: 100005 },
  { name: "Frank Miller", student_id: 100006 },
  { name: "Grace Kim", student_id: 100007 },
  { name: "Hugo Martinez", student_id: 100008 },
  { name: "Ivy Chen", student_id: 100009 },
  { name: "Jordan Lee", student_id: 100010 },
  { name: "Kara Nguyen", student_id: 100011 },
  { name: "Leo Patel", student_id: 100012 }
]

student_records = students.map do |attrs|
  Student.create!(name: attrs[:name], student_id: attrs[:student_id])
end

assignments = {
  student_records[0] => [ section_records[0], section_records[2] ],
  student_records[1] => [ section_records[0], section_records[3] ],
  student_records[2] => [ section_records[1], section_records[5] ],
  student_records[3] => [ section_records[3], section_records[6] ],
  student_records[4] => [ section_records[0], section_records[1], section_records[2] ],
  student_records[5] => [ section_records[7], section_records[6] ],
  student_records[6] => [ section_records[4], section_records[8] ],
  student_records[7] => [ section_records[0], section_records[8] ],
  student_records[8] => [ section_records[1], section_records[3] ],
  student_records[9] => [ section_records[5], section_records[7] ],
  student_records[10] => [ section_records[2], section_records[4] ],
  student_records[11] => [ section_records[6], section_records[8] ]
}

assignments.each do |student, sections|
  sections.each do |section|
    student.sections << section unless student.sections.include?(section)
  end
end

puts "Seed data created successfully!"
puts "Prefixes: #{Prefix.count}"
puts "Courses: #{Course.count}"
puts "Sections: #{Section.count}"
puts "Students: #{Student.count}"
