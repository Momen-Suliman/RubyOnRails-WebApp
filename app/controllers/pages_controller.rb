class PagesController < ApplicationController
  def home
    @students = Student.includes(:sections).order(:name)
    @courses = Course.includes(:prefix).order(:prefix_id, :number)
    @sections = Section.includes(:course, :students).order(:id)
    @prefixes = Prefix.includes(:courses).order(:name)
  end
end
