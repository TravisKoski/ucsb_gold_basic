class Waitlist < ApplicationRecord
  belongs_to :course
  has_many :students
  has_many :lineups, :dependent => :destroy
  has_many :students, :through => :lineups
end
