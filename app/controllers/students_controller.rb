class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def show
    @student = Student.find_by!(student_number: params[:student_number])
  end
end
