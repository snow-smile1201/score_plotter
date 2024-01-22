class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @times = Result.maximum('times').to_i
    @student = Student.find_by!(student_number: params[:student_number])
    @latest_result = @student.results.where(times: @times).first
    @latest_scores = [@latest_result&.basic_score, @latest_result&.personality, @latest_result&.self_image, @latest_result&.communication, @latest_result&.achievement_skill, @latest_result&.thinking_ability]
  
    @scores_basic = []
    @scores_personality = []
    @scores_self_image = []
    @scores_communication = []
    @scores_achievement_skill = []
    @scores_thinking_ability = []
    
    for n in 1..@times do
      result = @student.results.at_nth_time(n).first
      unless result.nil?
        score_ba = result.basic_score
        score_pe = result.personality
        score_se = result.self_image
        score_co = result.communication
        score_ac = result.achievement_skill
        score_th = result.thinking_ability
      else
        score_ba = 0
        score_pe = 0
        score_se = 0
        score_co = 0
        score_ac = 0
        score_th = 0
      end
      @scores_basic << score_ba
      @scores_personality << score_pe
      @scores_self_image << score_se
      @scores_communication << score_co
      @scores_achievement_skill << score_ac
      @scores_thinking_ability << score_th
    end
    html = render_to_string({template: 'students/show',layout: 'layouts/pdf',})
    pdf = Grover.new(html).to_pdf
    send_data(pdf, filename: "#{@student.student_number}_#{@student.name}(2024年3月).pdf", type: 'application/pdf')
  end
end
