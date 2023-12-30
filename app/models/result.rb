class Result < ApplicationRecord
  belongs_to :student, primary_key: :student_number
end
