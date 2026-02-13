json.extract! course, :id, :prefix_id, :number, :syllabus, :created_at, :updated_at
json.url course_url(course, format: :json)
