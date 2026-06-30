class PagesController < ApplicationController
  def home
    @students = Student.includes(:sections).order(:name).limit(6)
    @courses = Course.includes(:prefix).order(:prefix_id, :number).limit(6)
    @sections = Section.includes(:course, :students).order(:id).limit(6)
    @prefixes = Prefix.includes(:courses).order(:name).limit(6)
  end
end
