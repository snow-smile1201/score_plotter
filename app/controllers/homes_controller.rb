class HomesController < ApplicationController
  def top
    upload_file = params[:upload_file]
  end

  def create
    if params[:upload_file].present?
      upload_file = params[:upload_file].tempfile

      CSV.foreach(upload_file.path, headers: true, encoding: 'utf-8') do |row|

        student = Student.find_by(student_number: row['塾生番号']) || Student.new(convert_csv_to_hash(row))
        student.save
      end
      redirect_to request.referer
    end
  end

private

def convert_csv_to_hash(row)
  params = {
    student_number: row['塾生番号'],
    name: row['氏名'],
    class_type: row['クラス'],
    group: row['グループ'],
    admission_date: row['入塾時期'],
    grade: row['学年']
  }
end

end
