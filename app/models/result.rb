class Result < ApplicationRecord
  belongs_to :student, primary_key: :student_number
  scope :at_nth_time, -> (n) {where(times: n)}

end
