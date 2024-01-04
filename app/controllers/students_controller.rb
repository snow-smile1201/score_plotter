class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def show
    @times = Result.maximum('times').to_i
    @student = Student.find_by!(student_number: params[:student_number])
    @latest_result = @student.results.where(times: @times).first
    @latest_scores = [@latest_result&.basic_score, @latest_result&.personality, @latest_result&.self_image, @latest_result&.communication, @latest_result&.achievement_skill, @latest_result&.thinking_ability]
    
    @scores_per_time = []
    
    for n in 1..@times do
      result = @student.results.at_nth_time(n).first
      unless result.nil?
        scores = [result.basic_score, result.personality, result.self_image, result.communication, result.achievement_skill, result.thinking_ability]
      else
        scores = [0,0,0,0,0,0]
      end
      @scores_per_time << scores
    end
  end
end
