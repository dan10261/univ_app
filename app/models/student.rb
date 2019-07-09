class Student < ApplicationRecord
  has_many :student_courses
  validates :username,uniqueness: {case_sensitive: false}
  has_many :courses, through: :student_courses
end