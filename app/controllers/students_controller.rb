class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def show
    times = 5
    @student = Student.find_by!(student_number: params[:student_number])
    @result = @student.results.where(times: times).first
    @result.personality
    @result.self_image
    @result.communication
    @result.achievement_skill
    @result.thinking_ability
    @result.basic_score
  end
end
