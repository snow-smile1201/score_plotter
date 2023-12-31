class HomesController < ApplicationController
  def top
    upload_file = params[:upload_file]
  end

  def create
    if params[:upload_file].present?
      upload_file = params[:upload_file].tempfile

      CSV.foreach(upload_file.path, headers: true, encoding: 'utf-8') do |row|

        student = Student.find_by(student_number: row['塾生番号']) || Student.new(imported_student_params(row))
        student.save
        student.result = Result.new(imported_result_params(row))
        #result.student_idにはstudent.id（主キーに設定したstudent_number）が代入される
        student.result.student_id = student.id
        #result.timesはランクアップ実施のタイミングで変更する。
        result.times = 5
        result.save
      end
      redirect_to request.referer
    end
  end

private

  def imported_student_params(row)
    params = {
      student_number: row['塾生番号'],
      name: row['氏名'],
      class_type: row['クラス'],
      group: row['グループ'],
      admission_date: row['入塾時期'],
      grade: row['学年'].to_i
    }
  end

  def imported_result_params(row)
    params = {
      personality: row['【点数】愛される人格'],
      self_image: row['【点数】信念セルフイメージ'],
      communication: row['【点数】コミュニケーション能力'],
      achievement_skill: row['【点数】目標達成能力'],
      thinking_ability: row['【点数】考える力'],
      basic_score: row['【点数】基礎点'],
      class_rank: row['クラス順位'].to_i,
      grade_rank: row['学年順位'].to_i,
      weekly_achievement: row['週間達成数'].to_i,
      monthly_achievement: row['月間達成数'].to_i,
      mvp_percentage: row['MVP率']
    }
  end
end
