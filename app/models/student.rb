class Student < ApplicationRecord
  self.primary_key = :student_number
  has_many :results
  enum grade: {something_else: 0, e_first: 1, e_second: 2, e_third: 3, e_fourth: 4, e_fifth: 5, e_sixth: 6, j_first: 7, j_second: 8, j_third: 9, s_first: 10, s_second: 11, s_third: 12 }
end
